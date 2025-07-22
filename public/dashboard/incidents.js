async function chargerIncidentsAdmin() {
  try {
    const res = await fetch('/api/incidents-valides');
    const incidents = await res.json();

    const container = document.getElementById('Incidents');
    container.innerHTML = '';

    incidents.forEach(incident => {
      container.innerHTML += `
        <tr>
          <td>${incident.id}</td>
          <td>${incident.passager_nom ?? '-'} ${incident.passager_prenom ?? ''}</td>
          <td>${incident.conducteur_nom ?? '-'} ${incident.conducteur_prenom ?? ''}</td>
          <td>${incident.trajet ?? '-'}</td>
          <td>${incident.date_depart ?? '-'}</td>
          <td>${incident.heure_depart ?? '-'}</td>
          <td>${incident.heure_arrivee ?? '-'}</td>
          <td>${incident.passager_email ?? '-'}</td>
          <td>${incident.conducteur_email ?? '-'}</td>
          <td>${incident.message ?? '-'}</td>
          <td>
            <button class="btn btn-sm btn-success btn-contacter" data-email="${incident.conducteur_email}">Contacter le chauffeur</button>
            <button class="btn btn-sm btn-success btn-contacter" data-email="${incident.passager_email}">Contacter le passager</button>
           <button class="btn btn-sm btn-success btn-suspendre" 
            data-id="${incident.conducteur_id}" 
            data-status="${incident.conducteur_statut}">
            ${incident.conducteur_statut == 'actif' ? 'Suspendre le compte' : 'Activer le compte'}
          </button>
            <button class="btn btn-sm btn-danger btn-supprimer" data-id="${incident.conducteur_id}">Supprimer le compte</button>
            <button class="btn btn-sm btn-danger btn-supprimer-incident" data-id="${incident.id}">Supprimer l'incident</button>
          </td>
        </tr>
      `;
    });

    attacherListeners();

  } catch (err) {
    console.error("Erreur chargement incidents admin :", err);
  }
}

function attacherListeners() {
  document.querySelectorAll('.btn-suspendre').forEach(btn => {
    btn.addEventListener('click', suspendreUtilisateur);
  });

  document.querySelectorAll('.btn-supprimer').forEach(btn => {
    btn.addEventListener('click', supprimerUtilisateur);
  });

  document.querySelectorAll('.btn-supprimer-incident').forEach(btn => {
    btn.addEventListener('click', supprimerIncident);
  });

  document.querySelectorAll('.btn-contacter').forEach(btn => {
    btn.addEventListener('click', function() {
      const email = this.dataset.email;
      if (email) {
        window.location.href = `mailto:${email}`;
      } else {
        alert("Adresse email non disponible.");
      }
    });
  });
}
async function suspendreUtilisateur() {
  const id = this.dataset.id;
  const currentStatus = this.dataset.status;
  if (!id) return;

  const confirmMsg = currentStatus === 'actif'
    ? "Confirmer la suspension du compte ?"
    : "Confirmer la réactivation du compte ?";
  if (!confirm(confirmMsg)) return;

  const res = await fetch(`/api/utilisateurs/suspendre/${id}`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    }
  });

  if (res.ok) {
    const data = await res.json();

    const success = document.getElementById("alert1");
    const Mess = document.getElementById("Mcontainer");
    success.style.display = 'block';
    Mess.innerText = (data.nouveau_status === 'actif')
      ? "Le compte est de nouveau activé"
      : "Le compte a été suspendu";

    document.addEventListener('click', () => {
      success.style.display = 'none';
    });

    await chargerIncidentsAdmin();

  } else {
    alert("Erreur lors du changement de statut.");
  }
}

async function supprimerUtilisateur() {
  const id = this.dataset.id;
  if (!id) return;

  if (!confirm("Supprimer définitivement ce compte ?")) return;

  const res = await fetch(`/api/utilisateurs/${id}`, {
    method: 'DELETE',
    headers: {
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    }
  });

  if (res.ok) {
    alert("Compte supprimé !");
    await chargerIncidentsAdmin();
  } else {
    alert("Erreur lors de la suppression.");
  }
}

async function supprimerIncident() {
  const id = this.dataset.id;
  if (!id) return;

  if (!confirm("Supprimer définitivement cet incident ?")) return;

  const res = await fetch(`/api/incidents/${id}`, {
    method: 'DELETE',
    headers: {
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    }
  });

  if (res.ok) {
    await chargerIncidentsAdmin();
  } else {
    alert("Erreur lors de la suppression de l'incident.");
  }
}

document.addEventListener("DOMContentLoaded", chargerIncidentsAdmin);

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


