  let decisions = [];

  function setCookie(name, value, days) {
    const expires = new Date(Date.now() + days * 864e5).toUTCString();
    document.cookie = `${name}=${encodeURIComponent(value)}; expires=${expires}; path=/`;
  }

  function getCookie(name) {
    return document.cookie
      .split('; ')
      .find(row => row.startsWith(name + '='))
      ?.split('=')[1] || '';
  }

  document.addEventListener("DOMContentLoaded", () => {
    const banner = document.querySelector(".cookie-consent");
    const consent = getCookie("user_cookie_consent");

    if (consent === "accepted" || consent === "rejected") {
      console.log("Consentement déjà enregistré :", consent);
      return;
    }

    setTimeout(() => {
      banner.style.display = "block";
      banner.classList.add("-deploy");
    }, 1000);

    document.getElementById("accept").addEventListener("click", () => {
      setCookie("user_cookie_consent", "accepted", 365);
      decisions.push("accepted");
      console.log("Décisions enregistrées :", decisions);
      banner.style.display = "none";
    });

    document.getElementById("refus").addEventListener("click", () => {
      setCookie("user_cookie_consent", "rejected", 365);
      decisions.push("rejected");
      console.log("Décisions enregistrées :", decisions);
      banner.style.display = "none";
    });
  });



function getParamURL(search) {
  const params = new URLSearchParams(window.location.search);
  return params.get(search);
}

let places = parseInt(getParamURL("passagers"));
let jour = getParamURL("date");
let depart = getParamURL("city");
let arrivee = getParamURL("city2");

async function ChargerTrajets() {
  let reponse = await fetch(`/api/trajets?depart=${depart}&arrivee=${arrivee}&date=${date}&places=${places}`)
  let trajets = await reponse.json();

let TrajetsFiltrer = trajets.filter(trajet => {
    return (
        trajet.Trajet && 
        trajet.Trajet.toLowerCase().includes(depart?.toLowerCase()) &&
        trajet.Trajet.toLowerCase().includes(arrivee?.toLowerCase()) &&
        trajet.Date === jour &&
        trajet.places >= places
    );
});

  const container = document.getElementById("Users");
  container.innerHTML = "";



  if (TrajetsFiltrer.length === 0) {
  container.innerHTML = "<p>Aucun trajet ne correspond à votre recherche.</p>";
  return;
}
  TrajetsFiltrer.forEach(trajet => {
    let html = `
    <section class="list-group-item">
      <div class="list-group list">
        <div class="col-md-10">
          <img src="images/avataaars (1).png" class="pull-left photo">
          <h4 class="list-group-item-heading name">${trajet.nom}</h4>
          <p class="list-group-item-text title">chauffeur</p>
        </div>
        <div class="col-md-2">
          <div class="expertise">
            <p class="labels">
              Note : 4/5 <br>
             Places: ${trajet.places_disponibles} <br>
            Trajet : ${trajet.ville_depart} → ${trajet.ville_arrivee} <br>
            Date : ${trajet.date_creation} <br>
            Départ : ${trajet.heure_depart} <br>
            Arrivé : ${trajet.heure_arrivee} <br>
               <strong>Voyage écologique : ${trajet.eco_responsable == 1 ? "Oui" : "Non"}</strong>
            </p>
            <a href="Descriptions_chauffeurs/chauffeur1.html">
              <button type="button" class="btn btn-outline-success">Détails</button>
            </a>
          </div>
        </div>
      </div>
    </section>
    `;
    container.innerHTML += html;
  });
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/villes')
        .then(response => response.json())
        .then(data => {
            remplirDatalist('citylist1', data.depart);
            remplirDatalist('citylist2', data.arrivee);
        })
        .catch(error => console.error("Erreur de chargement des villes :", error));
});

function remplirDatalist(id, villes) {
    const datalist = document.getElementById(id);
    datalist.innerHTML = '';

    villes.forEach(ville => {
        const option = document.createElement('option');
        option.value = ville;
        datalist.appendChild(option);
    });
}
ChargerTrajets();
                   

// const avispage = document.getElementById("nos_avis");

// avispage.addEventListener('click',() => {
//   window.location.href = "/nos_avis.html";
// })







 












         