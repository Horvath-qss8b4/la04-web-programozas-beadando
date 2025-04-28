async function betoltKonyveket() {
  const res = await fetch("http://localhost:3000/konyvek");
  const konyvek = await res.json();
  const tabla = document
    .getElementById("konyvTabla")
    .getElementsByTagName("tbody")[0];
  tabla.innerHTML = ""; // előző sorok törlése
  konyvek.forEach((k) => {
    const sor = tabla.insertRow();
    sor.innerHTML = `
          <td>${k.Id}</td>
          <td>${k.Cim}</td>
          <td>${k.Szerzo}</td>
          <td>${k.Kategoria || ""}</td>
          <td>${k.Kiado || ""}</td>
          <td>${k.Ar} Ft</td>
        `;
  });
}
