async function chargerAvisValidés() {

  try {
    const res = await fetch('/api/avis-plateforme');
    const avis = await res.json();

    const avisValidés = avis.filter(a => a.valide === 1 || a.valide === "1");

    const container = document.getElementById('avisContainer');
container.innerHTML = '';

avisValidés.forEach((avis) => {
    container.innerHTML += `
        <div class="testimonial4_slide text-center">
            <img src="${avis.photo}" alt="Photo de ${avis.nom_prenom}" class="img-circle img-responsive" />
            <p>${avis.message}</p>
            <h4>${avis.nom_prenom}</h4>
        </div>
    `;
});

  } catch (e) {
    console.error("Erreur chargement des avis :", e);
  }
}
document.addEventListener("DOMContentLoaded", () => {
  chargerAvisValidés();
});
