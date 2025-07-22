async function chargerChauffeurs() {
  try {
    const token = localStorage.getItem("token");
    const res = await fetch("/api/admin/chauffeurs", {
      headers: {
        Authorization: `Bearer ${token}`
      }
    });
    const data = await res.json();
    console.log("Données chauffeurs reçues :", data);

    const tbody = document.getElementById("Chauffeurs");
    tbody.innerHTML = "";

    data.forEach(chauffeur => {
      tbody.innerHTML += `
        <tr>
          <td>${chauffeur.nom}</td>
          <td>${chauffeur.prenom}</td>
          <td>${chauffeur.email}</td>
          <td>${chauffeur.telephone}</td>
          <td>
            <a href="#" 
              class="btn btn-sm btn-neutral suspendre-btn" 
              data-id="${chauffeur.id}">
            ${chauffeur.status === 'suspendu' ? 'Réactiver le compte' : 'Suspendre le compte'}
            </a>
            <button class="btn btn-sm btn-danger supprimer-btn" data-id="${chauffeur.id}">Supprimer</button>
        </td>
        </tr>
      `;
    });
  } catch (e) {
    console.error("Erreur chargement chauffeurs :", e);
  }
}
document.addEventListener("DOMContentLoaded", chargerChauffeurs);



document.addEventListener("click", function(e) {
  if (e.target.matches(".suspendre-btn")) {
    e.preventDefault();

    const button = e.target;
    const success = document.getElementById("alert1");
    const Mess = document.getElementById("Mcontainer");
    const id = button.dataset.id;
    const token = localStorage.getItem("token");

    fetch('/api/utilisateurs/suspendre/' + id, {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/json'
      }
    })
    .then(resp => resp.json())
    .then(data => {

      button.textContent = data.nouveau_status === "suspendu"
        ? "Réactiver le compte"
        : "Suspendre le compte";

      success.style.display = 'block';
      Mess.innerText = data.nouveau_status === "suspendu"
        ? "Le compte a été suspendu"
        : "Le compte est de nouveau activé";

      document.addEventListener('click', () => {
        success.style.display = 'none';
      }, { once: true });

    })
    .catch(console.error);
  }
});


document.addEventListener("click", function(e) {
  if (e.target.matches(".supprimer-btn")) {
    e.preventDefault();

    if (!confirm("Êtes-vous sûr de vouloir supprimer ce chauffeur ?")) {
      return;
    }

    const id = e.target.dataset.id;
    const token = localStorage.getItem("token");

    fetch('/api/admin/chauffeurs/' + id, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/json'
      }
    })
    .then(resp => resp.json())
    .then(data => {
      alert(data.message);
      chargerChauffeurs();
    })
    .catch(error => {
      console.error("Erreur lors de la suppression :", error);
    });
  }
});





async function AfficherMessages() {
let reponse = await fetch("/api/contacts");
let result = await reponse.json();
  

    const container = document.getElementById("Msg");
    const compteur = result[0]["Nombre-messages"];
    container.innerHTML = "";
      container.innerHTML += `
                            <i class="bi bi-chat"></i> Messages
                            
                                `;
                             ;
                            }
                            document.addEventListener("DOMContentLoaded", AfficherMessages());


                            
  document.addEventListener("DOMContentLoaded", () => {
    const decoBtn = document.getElementById("deco");

    if (decoBtn) {
        decoBtn.addEventListener("click", async () => {
            try {
                await fetch('/api/logout', {
                    method: 'POST',
                    headers: {
                        'Authorization': `Bearer ${localStorage.getItem("token")}`,
                        'Content-Type': 'application/json'
                    }
                });
            } catch (e) {
                console.error("Erreur API logout :", e);
            } finally {
                localStorage.removeItem("token");
                localStorage.removeItem("user");
                window.location.href = "/index01.html";
            }
        });
    }
});


       