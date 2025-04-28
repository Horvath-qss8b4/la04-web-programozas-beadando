// Kategóriák betöltése
fetch("http://localhost:3000/kategoriak")
  .then((res) => res.json())
  .then((data) => {
    const lista = document.querySelector("section h3.section-title + ul");
    if (lista) {
      lista.innerHTML = "";
      data.forEach((kat) => {
        const li = document.createElement("li");
        li.textContent = kat.Kategoria;
        lista.appendChild(li);
      });
    }
  });
