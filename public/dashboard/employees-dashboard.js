async function chargerAvisChauffeur() {
    const token = localStorage.getItem("token");
    const conducteurId = localStorage.getItem("userId");

    if (!token) {
        alert("Vous devez être connecté pour voir vos avis.");
        return;
    }

    try {
        const res = await fetch('/api/avis/chauffeurs', {
            headers: {
                "Accept": "application/json",
                "Authorization": `Bearer ${token}`,
            }
        });
        const avis = await res.json();

        const table = document.getElementById("employee-Avis");
        table.innerHTML = "";

        avis.forEach(a => {
    table.innerHTML += `
        <tr>
            <td>${a.passager_prenom} ${a.passager_nom}</td>
            <td>${a.conducteur_prenom} ${a.conducteur_nom}</td>
            <td>${a.trajet}</td>
            <td>${new Date(a.date_creation).toLocaleDateString()}</td>
            <td>${a.passager_email}</td>
            <td>${a.conducteur_email}</td>
            <td>${a.note ?? '-'}</td>
            <td>${a.ponctualite ?? '-'}</td>
            <td>${a.conduite_securisee ? 'Oui' : 'Non'}</td>
            <td>${a.recommande ? 'Oui' : 'Non'}</td>
            <td>${a.commentaire ?? '-'}</td>
            <td>
            <a href="#" class="btn btn-sm btn-neutral" onclick="validerAvis(${a.id})">Accepter</a>
            <button class="btn btn-sm btn-danger">Supprimer</button>
            </td>
         </tr>
            `;
        });
            document.getElementById("avis").textContent = avis.length;
    } catch (error) {
        console.error(error);
        alert("Erreur lors du chargement des avis.");
    }
}
window.validerAvis = async function (avisId) {
    const token = localStorage.getItem("token");

    try {
        const res = await fetch(`/api/avis/valider/${avisId}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            }
        });

        const data = await res.json();
        alert(data.message);
        location.reload();
    } catch (error) {
        console.error("Erreur lors de la validation :", error);
        alert("Échec de la validation de l'avis.");
    }
};

document.addEventListener("DOMContentLoaded", chargerAvisChauffeur);



async function chargerIncidents() {
    try {
        const token = localStorage.getItem("token");
        const res = await fetch("/api/incidents-attente", {
            headers: {
                "Authorization": `Bearer ${token}`
            }
        });
        if (!res.ok) throw new Error("Erreur API");

        const incidents = await res.json();
        const table = document.getElementById("employee-Avis2");
        table.innerHTML = "";

      incidents.forEach(incident => {
    table.innerHTML += `
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
         <button onclick="validerIncident(${incident.id})" class="btn btn-sm btn-success">Accepter</button>
        <button onclick="rejeterIncident(${incident.id})" class="btn btn-sm btn-danger">Supprimer</button>
        </td>
        </tr>
    `;
});
         document.getElementById("incidents").textContent = incidents.length;
    } catch (e) {
        console.error(e);
        alert("Erreur lors du chargement des incidents");
    }
}

async function validerIncident(id) {
  try {
    const res = await fetch(`/api/incidents/${id}/valider`, {
      method: 'PATCH'
    });
    const data = await res.json();
    chargerIncidents(); 
  } catch (err) {
    console.error("Erreur validation :", err);
  }
}

async function rejeterIncident(id) {
  try {
    const res = await fetch(`/api/incidents/${id}/rejeter`, {
      method: 'PATCH'
    });
    const data = await res.json();
    chargerIncidents(); 
  } catch (err) {
    console.error("Erreur suppression :", err);
  }
}
document.addEventListener("DOMContentLoaded", chargerIncidents);


async function fetchUserInfo() {

  const token = localStorage.getItem('token');
  if (!token) {
    alert('Vous devez vous reconnecter.');
    return window.location.href = '/connexion-Ecoride.html';
  }

  
 const res = await fetch('/api/employee-info', {
    method: 'GET',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json'
    }
  });

  
  if (!res.ok) {
    alert('Session expirée ou non autorisé');
    return window.location.href = '/connexion-Ecoride.html';
  }


  const employee = await res.json();
  document.getElementById("employee-name1").textContent = `Bonjour ${employee.prenom} ! Bienvenue sur votre Tableau de bord.`;
 document.getElementById("employee-name2").textContent = `${employee.prenom} ${employee.nom}`;
 document.getElementById("employee-email").textContent = employee.email;
 
  localStorage.setItem('userId', utilisateur.id);
}


document.addEventListener('DOMContentLoaded', () => {
  fetchUserInfo();
});


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
