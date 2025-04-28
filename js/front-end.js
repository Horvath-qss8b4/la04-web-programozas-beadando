// Keresőmező, tábla és placeholder kezelés
const keresSection = document.querySelector("main article section");
const placeholderP = keresSection.querySelector("p"); // Meglévő <p>
const placeholderText = placeholderP
  ? placeholderP.textContent
  : "Itt jelennek meg a könyvek, majd keresési eredmények...";

// 🔧 INPUT mező létrehozása
const input = document.createElement("input");
input.type = "text";
input.placeholder = "Keresés könyvre, szerzőre...";
input.classList.add("form-control", "mb-3");

// ⬅️ Beillesztés a <p> ELÉ, így input kerül felülre
if (placeholderP) {
  keresSection.insertBefore(input, placeholderP);
} else {
  keresSection.appendChild(input);
}

// 🔧 TÁBLA létrehozása
const eredmenyTabla = document.createElement("table");
eredmenyTabla.classList.add("table", "table-striped");
keresSection.appendChild(eredmenyTabla);

// 🔍 INPUT eseménykezelő
input.addEventListener("input", () => {
  const keresettSzoveg = input.value.trim();

  // Ha mező üres, töröljük a táblát és visszarakjuk a <p>-t
  if (keresettSzoveg === "") {
    eredmenyTabla.innerHTML = "";

    // Ha <p> még nincs, hozzuk vissza
    if (!keresSection.querySelector("p")) {
      const ujP = document.createElement("p");
      ujP.textContent = placeholderText;
      keresSection.appendChild(ujP); // input és tábla alá kerül
    }

    return;
  }

  // 🔍 Keresés API-val
  fetch(`http://localhost:3000/kereses?q=${encodeURIComponent(keresettSzoveg)}`)
    .then((res) => res.json())
    .then((data) => {
      // Ha van találat, töröljük a <p>-t, ha még ott van
      const letezoP = keresSection.querySelector("p");
      if (letezoP) {
        letezoP.remove();
      }

      let html = `
        <thead> 
          <tr>
            <th>Cím</th>
            <th>Szerző</th>
            <th>Kategória</th>
            <th>Kiadó</th>
            <th>Ár</th>
          </tr>
        </thead>
        <tbody>
      `;

      data.forEach((konyv) => {
        html += `
          <tr>
            <td>${konyv.Cim}</td>
            <td>${konyv.Szerzo}</td>
            <td>${konyv.Kategoria}</td>
            <td>${konyv.Kiado}</td>
            <td>${konyv.Ar} Ft</td>
          </tr>
        `;
      });

      html += "</tbody>";
      eredmenyTabla.innerHTML = html;
    });
});
