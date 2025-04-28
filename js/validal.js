document.querySelector("form").addEventListener("submit", function (e) {
  const nameInput = document.getElementById("name");
  const emailInput = document.getElementById("email");
  const messageInput = document.getElementById("message");

  const nameValue = nameInput.value.trim();
  const emailValue = emailInput.value.trim();
  const messageValue = messageInput.value.trim();

  const nameRegex = /^[A-Za-zÁÉÍÓÖŐÚÜŰáéíóöőúüű\s]+$/;
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  let valid = true;
  let errorMsg = "";

  // Ellenőrizzük, hogy minden mező ki van-e töltve
  if (!nameValue || !emailValue || !messageValue) {
    valid = false;
    errorMsg += "Minden mező kitöltése kötelező.\n";
  }

  // Név validáció
  if (nameValue && !nameRegex.test(nameValue)) {
    valid = false;
    errorMsg += "A név csak betűket tartalmazhat.\n";
  }

  // Email validáció
  if (emailValue && !emailRegex.test(emailValue)) {
    valid = false;
    errorMsg += "Adj meg egy érvényes email címet.\n";
  }

  if (!valid) {
    e.preventDefault(); // ne küldje el az űrlapot
    alert(errorMsg);
  } else {
    e.preventDefault(); // itt is megállítjuk, ha nem akarsz tényleges küldést (pl. még nincs backend)
    alert("Sikeres üzenetküldés!");
    // űrlap kiürítése:
    nameInput.value = "";
    emailInput.value = "";
    messageInput.value = "";
  }
});
