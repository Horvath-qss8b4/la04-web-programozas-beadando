const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.set("json spaces", 2);

// MySQL kapcsolat
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "", // ha van jelszó, ide
  database: "konyv",
});

db.connect((err) => {
  if (err) {
    console.error("Hiba a kapcsolódásnál:", err);
    return;
  }
  console.log("Sikeres MySQL kapcsolat!");
});

// Kategóriák lekérdezése
app.get("/kategoriak", (req, res) => {
  db.query("SELECT * FROM Kategoriak", (err, results) => {
    if (err) {
      return res.status(500).json({ error: "Hiba a lekérdezésnél" });
    }
    res.json(results);
  });
});

// Könyv keresés
app.get("/kereses", (req, res) => {
  const keres = `%${req.query.q || ""}%`;
  const sql = `
    SELECT Konyvek.*, Kategoriak.Kategoria, Kiadok.Kiado
    FROM Konyvek
    LEFT JOIN Kategoriak ON Konyvek.Kategoria_id = Kategoriak.Kategoria_id
    LEFT JOIN Kiadok ON Konyvek.Kiado_id = Kiadok.Kiado_id
    WHERE Konyvek.Cim LIKE ? OR Konyvek.Szerzo LIKE ? OR Kategoriak.Kategoria LIKE ? OR Kiadok.Kiado LIKE ?
  `;
  db.query(sql, [keres, keres, keres, keres], (err, results) => {
    if (err) {
      return res.status(500).json({ error: "Hiba a keresésnél" });
    }
    res.json(results);
  });
});

// Minden könyv minden adatával
app.get("/konyvek", (req, res) => {
  const query = `
    SELECT 
      k.Id, k.Cim, k.Szerzo, ka.Kategoria, ki.Kiado, k.Ar
    FROM 
      Konyvek k
      LEFT JOIN Kategoriak ka ON k.Kategoria_id = ka.Kategoria_id
      LEFT JOIN Kiadok ki ON k.Kiado_id = ki.Kiado_id
  `;
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

app.listen(port, () => {
  console.log(`Szerver fut: http://localhost:${port}`);
});
