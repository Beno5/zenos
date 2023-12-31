document.addEventListener("DOMContentLoaded", function () {
  const mainImageUpload = document.getElementById("main_image");
  const secondaryImagesUpload = document.getElementById("secondary_images");
  const mainImagePreview = document.getElementById("main_image_preview");
  const secondaryImagesPreview = document.getElementById("secondary_images_preview");

    mainImageUpload.addEventListener("change", function (event) {
    mainImagePreview.innerHTML = ""; // Resetujemo prikaz glavne slike

    const file = event.target.files[0];
    if (file) {
      const imageDiv = document.createElement("div");
      imageDiv.className = "col-3"; // Koristimo Bootstrap grid kolone (veličina 3)

      const image = document.createElement("img");
      image.src = URL.createObjectURL(file);
      image.className = "img-fluid"; // Dodajemo Bootstrap klasu za responsivne slike

      const deleteButton = document.createElement("button");
      deleteButton.textContent = "Remove";
      deleteButton.className = "remove-image btn btn-danger btn-sm";

      imageDiv.appendChild(image);
      imageDiv.appendChild(deleteButton);
      mainImagePreview.appendChild(imageDiv);

      deleteButton.addEventListener("click", function () {
        mainImagePreview.innerHTML = ""; // Uklanjamo glavnu sliku
        mainImageUpload.value = null; // Resetujemo input polje za glavnu sliku
      });
    }
  });

  secondaryImagesUpload.addEventListener("change", function (event) {
    secondaryImagesPreview.innerHTML = ""; // Resetujemo prikaz sporednih slika

    for (const file of event.target.files) {
      const imageDiv = document.createElement("div");
      imageDiv.className = "col-3"; // Koristimo Bootstrap grid kolone (veličina 3)

      const image = document.createElement("img");
      image.src = URL.createObjectURL(file);
      image.className = "img-fluid"; // Dodajemo Bootstrap klasu za responsivne slike

      const deleteButton = document.createElement("button");
      deleteButton.textContent = "Remove";
      deleteButton.className = "remove-image btn btn-danger btn-sm";

      imageDiv.appendChild(image);
      imageDiv.appendChild(deleteButton);
      secondaryImagesPreview.appendChild(imageDiv);

      deleteButton.addEventListener("click", function () {
        secondaryImagesPreview.removeChild(imageDiv);
        // Takođe možete dodati logiku za uklanjanje slika sa servera ako je potrebno
      });
    }

    // Kreirajte karusel za sporedne slike koristeći biblioteku kao što je Slick Carousel
    // Detalje o implementaciji karusela možete pronaći u dokumentaciji biblioteke.
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const imagePreviews = document.querySelectorAll(".image-preview");
  const carousel = document.querySelector(".owl-carousel");
  const owl = $(carousel);

  imagePreviews.forEach((preview, index) => {
    preview.addEventListener("click", () => {
      owl.trigger("to.owl.carousel", [index, 300]);
      imagePreviews.forEach((preview) => preview.classList.remove("selected"));
      preview.classList.add("selected");
    });
  });
});
