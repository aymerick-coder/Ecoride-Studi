var options = {
    valueNames: [ 'name', 'title', 'expertise' ]
  };

async function AfficherTrajets() {
  let reponse = await fetch("/api/trajets")
  let trajets = await reponse.json();
  console.log("resultat json", trajets);
  console.log(trajets);
  let result = document.getElementById("Users");
  trajets.forEach(trajet => {
      let html = `
    <section class="list-group-item">
        <div class="card">
            <section class="summary">
                     <img src="images/avataaars (1).png" class="pull-left photo">
                <h2>${trajet.nom}</h2>
                 <p class="labels">
               Note :${trajet.note_moyenne ?? 0}/5<br>
            Places: ${trajet.places_disponibles} <br>
            Trajet : ${trajet.ville_depart} → ${trajet.ville_arrivee} <br>
            Date : ${trajet.date_creation} <br>
            Départ : ${trajet.heure_depart} <br>
            Arrivé : ${trajet.heure_arrivee} <br>
            Crédits : ${trajet.prix_credits} <br>
            <strong>Voyage écologique : ${trajet.eco_responsable == 1 ? "Oui" : "Non"}</strong>
            </p>
          ${trajet.conducteur_id ? `
<a href="Descriptions_chauffeurs/chauffeur1.html?id=${trajet.conducteur_id}&trajet_id=${trajet.id}">
    <button type="button" class="btn btn-outline-success">Détails</button>
  </a>
` : `
  <button type="button" class="btn btn-secondary" disabled>Aucun chauffeur</button>
`}

            <button data-trajet-id="${trajet.id}" type="button" class="btn btn-outline-success participer-btn">Participer</button>
            </section>
        </div>
    </section>
    `;
    result.innerHTML += html;
  });
}
AfficherTrajets();

function desactiverFiltres() {
    const filtres = ["tous", "ecolo", "filtrerPrix", "customRange2"];
    filtres.forEach(id => {
        const element = document.getElementById(id);
        if (element) element.disabled = true;
    });
}

function activerFiltres() {
    const filtres = ["tous", "ecolo", "filtrerPrix", "customRange2"];
    filtres.forEach(id => {
        const element = document.getElementById(id);
        if (element) element.disabled = false;
    });
}

function getParamURL(search) {
    const params = new URLSearchParams(window.location.search);
    return params.get(search);
}

function parseDateFr(str) {
    if (!str) return new Date(0);
    const [jj, mm, aaaa] = str.split('/');
    return new Date(Number(aaaa), Number(mm) - 1, Number(jj));
}

function parseHtmlDate(str) {
    if (!str) return new Date(0);
    const [yyyy, mm, dd] = str.split("-");
    return new Date(Number(yyyy), Number(mm) - 1, Number(dd));
}

let resultfinal = [];
const places  = parseInt(getParamURL("passagers"), 10) || 0;
const jour    = getParamURL("date");
const depart  = getParamURL("city")   || "";
const arrivee = getParamURL("city2")  || "";

function renderTrajets(trajets) {
    const container = document.getElementById("Users");
    container.innerHTML = "";

    if (trajets.length === 0) {
        container.innerHTML = "<p>Aucun trajet disponible.</p>";
        desactiverFiltres();
        return;
    } else {
        activerFiltres();
    }

    trajets.forEach(trajet => {
        const html = `
            <section class="list-group-item">
                <div class="card">
                    <section class="summary">
                        <img src="images/avataaars (1).png" class="pull-left photo">
                        <h2>${trajet.nom}</h2>
                        <hr>
                        <p class="labels">
                            Note : ${trajet.note_moyenne ?? 0}/5<br>
                            Places : ${trajet.places_disponibles}<br>
                            Trajet : ${trajet.ville_depart} → ${trajet.ville_arrivee}<br>
                            Date : ${trajet.date_creation}<br>
                            Départ : ${trajet.heure_depart}<br>
                            Arrivée : ${trajet.heure_arrivee}<br>
                            Crédits : ${trajet.prix_credits}<br>
                            <strong>Écolo : ${trajet.eco_responsable == 1 ? "Oui" : "Non"}</strong>
                        </p>
                       <a href="Descriptions_chauffeurs/chauffeur1.html?id=${trajet.conducteur_id}&trajet_id=${trajet.id}">
                            <button class="btn btn-outline-success">Détails</button>
                        </a>
                        <button class="btn btn-success participer-btn"
                                data-id="${trajet.id}"
                                data-bs-toggle="modal"
                                data-bs-target="#confirmModal">
                            Participer
                        </button>
                    </section>
                </div>
            </section>
        `;
        container.innerHTML += html;
    });

    document.querySelectorAll(".participer-btn").forEach(button => {
        button.addEventListener("click", () => {
            const id = button.dataset.id;
            document.getElementById("confirmerPaiement").setAttribute("data-id", id);

            let confirmModalInstance = bootstrap.Modal.getInstance(document.getElementById("confirmModal"));
            if (!confirmModalInstance) {
                confirmModalInstance = new bootstrap.Modal(document.getElementById("confirmModal"), {
                    backdrop: true,
                    keyboard: true
                });
            }
            confirmModalInstance.show();
        });
    });
}

document.addEventListener("DOMContentLoaded", async () => {
    desactiverFiltres();
    await ChargerTrajets();
    initFiltres();
});



async function ChargerTrajets() {
  console.log("PARAMS:", { depart, arrivee, jour, places });
  const response = await fetch(
    `/api/trajets?depart=${encodeURIComponent(depart)}&arrivee=${encodeURIComponent(arrivee)}&date=${encodeURIComponent(jour)}&places=${places}`
  );
  const trajets = await response.json();

  if (!depart || !arrivee || !jour || places <= 0) {
    console.log("Recherche incomplète, chargement annulé.");
    document.getElementById("error").innerHTML = "<h1>Veuillez faire une recherche avant de pouvoir continuer.</h1>";
    document.getElementById("Users").style.display = 'none';
    return;
  }

  const today = new Date();
  today.setHours(0, 0, 0, 0);

resultfinal = trajets.filter(trajet => {
  const depDate = parseDateFr(trajet.date_creation);

  const depOnlyDate = new Date(depDate.getFullYear(), depDate.getMonth(), depDate.getDate());
  const searchDate = parseDateFr(jour); 
  const searchOnlyDate = new Date(searchDate.getFullYear(), searchDate.getMonth(), searchDate.getDate());

  return (
    depOnlyDate.getTime() === searchOnlyDate.getTime() &&
    trajet.ville_depart.toLowerCase().includes(depart.trim().toLowerCase()) && 
    trajet.ville_arrivee.toLowerCase().includes(arrivee.trim().toLowerCase()) && 
    trajet.places_disponibles > 0 &&
    Boolean(trajet.conducteur_id)
  );
});

  const msgCont = document.getElementById("error");
  if (!resultfinal.length) {
    msgCont.innerHTML = "<h1>Aucun trajet ne correspond à votre recherche.</h1>";

    const selectBox = document.getElementById("dateSecour");
const prochaineDateP = document.getElementById("prochaineDateTexte");

selectBox.style.display = "block";

try {
  const res = await fetch(`/api/prochaine-date?depart=${depart}&arrivee=${arrivee}&places=${places}`);
  const data = await res.json();

  if (data.date && prochaineDateP) {
    prochaineDateP.innerText = `Prochaine date dispo : ${data.date}`;
  } else {
    prochaineDateP.innerText = "Aucune date disponible pour le moment";
  }
} catch (err) {
  console.error("Erreur API prochaine-date", err);
  prochaineDateP.innerText = "Erreur de chargement";
}
    return;
  } else {
    msgCont.innerHTML = "<h1>Covoiturage(s) disponible(s)</h1>";
    document.getElementById("Users").style.display = 'block';
  }

  renderTrajets(resultfinal);
}

function initFiltres() {
 
  document.getElementById("tous").addEventListener("click", () => {
    renderTrajets(resultfinal);
  });


  document.getElementById("ecolo").addEventListener("click", () => {
    renderTrajets(
      resultfinal.filter(t => t.eco_responsable == 1)
    );
  });


  document.getElementById("filtrerPrix").addEventListener("click", () => {
    const max = parseFloat(document.getElementById("prix").value) || 0;
    const tol = 5;
    renderTrajets(
      resultfinal.filter(t =>
        Math.abs(t.prix_credits - max) <= tol
      )
    );
  });

 document.getElementById("customRange2").addEventListener("input", e => {
  const minNote = parseFloat(e.target.value) || 0;
  renderTrajets(
    resultfinal.filter(t => (t.note_moyenne ?? 0) >= minNote)
  );
});
};

document.addEventListener("DOMContentLoaded", async () => {
  await ChargerTrajets();
  initFiltres();
});


document.addEventListener('click', function (e) {
    if (e.target.classList.contains('participer-btn')) {
        const trajetId = e.target.dataset.id;
        console.log("TrajetID récupéré depuis delegation:", trajetId);

    }
});

async function participer(trajetId) {
    const token = localStorage.getItem('token');
    try {
        const res = await fetch(`/api/trajets/${trajetId}/participer`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            }
        });
        const data = await res.json();
       if (res.ok) {
    alert("Participation confirmée !");
    await ChargerTrajets(); 
        } else {
            alert(data.message || "Erreur lors de la participation");
        }
    } catch (err) {
        console.error(err);
        alert("Une erreur réseau est survenue");
    }
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




const Brecherche = document.getElementById("searchbutton");
const container2 = document.getElementById("error");

Brecherche.addEventListener('click',() => {
  console.log('test');
  container2.innerHTML = "Chargement en cour...";
    const ChargerDonnee = new Promise((resolve) => {
  setTimeout(() => {
    resolve("Données chargées");
  }, 5000)
}); 
ChargerDonnee.then(resultat => {
  container2.innerHTML = resultat;
}).catch(() => {
  container2.innerHTML= "Une erreur est survenue";
})
})



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

  $(document).ready(function(){
    $('input:radio[name="Ben"]').change(function() {
        alert("Type: "+$(this).val());
    });
});




const confirmerButton = document.getElementById("confirmerPaiement");
const connectbutton = document.getElementById("connexion");
const creerbutton = document.getElementById("creercompte");

confirmerButton.addEventListener("click", async () => {
    const modal = document.getElementById("confirmModal");
    const trajetId = confirmerButton.getAttribute("data-id");

    const token = localStorage.getItem("token");
    if (!token) {
        const compteModal = new bootstrap.Modal(document.getElementById('compteModal'));
        compteModal.show();
         connectbutton.addEventListener('click',() => {
      window.location.href = "login-02.html";
    })
     creerbutton.addEventListener('click',() => {
      window.location.href = "register.html";
    })
        return;
    }

    try {
        const res = await fetch(`/api/trajets/${trajetId}/participer`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            }
        });

        const data = await res.json();

        if (res.ok) {
            const confirmModal = bootstrap.Modal.getInstance(document.getElementById('confirmModal'));
            confirmModal.hide();

            const paiementModal = new bootstrap.Modal(document.getElementById('paiementSuccessModal'));
            paiementModal.show();

            setTimeout(() => {
                document.getElementById("spinnerMessage").innerHTML = "<p>Redirection en cours...</p>";
            }, 4000);

            setTimeout(() => {
                location.reload();
            }, 8000);
        } else {
            alert(data.message || "Erreur lors de la participation.");
        }
    } catch (err) {
        console.error(err);
        alert("Erreur réseau");
    }
});

document.querySelectorAll('.modal').forEach(modal => {
    modal.addEventListener('hidden.bs.modal', () => {
        document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
        document.body.classList.remove('modal-open');
        document.body.style.paddingRight = '';
    });
});


