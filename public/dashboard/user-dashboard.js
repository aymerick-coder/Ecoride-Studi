async function AfficherHist() {
  const token = localStorage.getItem('token');
  let response = await fetch("/api/trajets/historique-passager", {
    headers: {
      "Authorization": `Bearer ${token}`
    }
  });
  let result = await response.json();

  const container = document.getElementById("users-hist");
  container.innerHTML = "";

  result.forEach(trajet => {
    container.innerHTML += `
      <tr  data-id="${trajet.id}">
  <td>${trajet.ville_depart} → ${trajet.ville_arrivee}</td>
  <td>${trajet.conducteur_nom ?? "inconnu"}</td>
  <td>${new Date(trajet.date_creation).toLocaleDateString()}</td>
  <td>${new Date(trajet.heure_depart).toLocaleTimeString([], {hour:'2-digit', minute:'2-digit'})}</td>
  <td>${new Date(trajet.heure_arrivee).toLocaleTimeString([], {hour:'2-digit', minute:'2-digit'})}</td>
  <td>${trajet.credits_depenses}</td>
  <td>
    <button class="btn btn-sm btn-danger">Supprimer</button>
  </td>
</tr>
    `;
  });
    document.getElementById("trajet_passager").textContent = result.length;
}


document.getElementById("users-hist").addEventListener("click", function(e) {
  if (e.target && e.target.matches(".btn-danger")) {
    const button = e.target;
    const row = button.closest("tr");
    const trajetId = row.dataset.id;
    const token = localStorage.getItem("token");

    if (confirm("Confirmer la suppression de ce trajet ?")) {
      fetch(`/api/trajets/historique-passager/${trajetId}`, {
        method: 'DELETE',
        headers: {
          "Authorization": `Bearer ${token}`,
          "Accept": "application/json"
        }
      })
      .then(res => res.json())
      .then(data => {
        alert(data.message);
        row.remove();
      })
      .catch(console.error);
    }
  }
});
document.addEventListener("DOMContentLoaded", AfficherHist);



document.addEventListener('DOMContentLoaded', () => {
 
  fetchUserInfo();
  AfficherHist2();
  chargerVehicules();

async function chargerVehicules() {
   const userId = localStorage.getItem('userId');
  const token  = localStorage.getItem('token');
  try {
    const response = await fetch(`/api/vehicules/${userId}`, {
      headers: {
      'Accept':        'application/json',
      'Authorization': `Bearer ${token}`
    }
    });
    const vehicules = await response.json();
    
    const select = document.querySelector('select[name="vehicule_id"]');
    select.innerHTML = '<option disabled selected>Choisir un véhicule</option>';
    
    vehicules.forEach(v => {
     select.innerHTML += `<option value="${v.id}">${v.marque} - ${v.modele}</option>`;
    });
  } catch (err) {
    console.error('Erreur lors du chargement des véhicules', err);
  }
}


  const form = document.getElementById('trajet-form');
  if (!form) {
    console.error("Form #trajet-form introuvable !");
    return;
  }

  form.addEventListener('submit', async e => {
    e.preventDefault();

  
    const token = localStorage.getItem('token');
    if (!token) {
      alert('Vous devez être connecté pour créer un trajet.');
      return window.location.href = '/login-02.html';
    }

     const isoDate = form.querySelector('input[name="date_creation"]').value;
     const [yyyy, mm, dd] = isoDate.split('-');
     const frenchDate = `${dd}/${mm}/${yyyy}`;

    
    const data = {
  ville_depart: form.querySelector('input[name="ville_depart"]').value,
  ville_arrivee: form.querySelector('input[name="ville_arrivee"]').value,
  heure_depart: form.querySelector('input[name="heure_depart"]').value,
  heure_arrivee: form.querySelector('input[name="heure_arrivee"]').value,
  date_creation: frenchDate, 
  prix_credits: parseInt(form.querySelector('input[name="prix_credits"]').value, 10),
  vehicule_id: form.querySelector('select[name="vehicule_id"]').value,
    };
    try {

      const res = await fetch("/api/trajets", {
        
        method: 'POST',
      headers: {
      'Accept':        'application/json',
      "Content-Type":  "application/json",
      'Authorization': `Bearer ${token}`
    },
        body: JSON.stringify(data),
      });
       const alert = document.getElementById("Alert1");
      if (res.status !== 201 && res.status !== 422) {
  const text = await res.text();
  return alert(`Erreur réseau : ${res.status} (voir console)`);
}

      if (res.status === 422) {
        const payload = await res.json();
        const first = Object.values(payload.errors)[0][0];
        return alert(`Erreur d’envoi trajet : ${first}`);
      }
      if (!res.ok) {
        return alert(`Erreur réseau : ${res.status}`);
      }  
      form.reset();
       alert.style.display = 'block';
        document.addEventListener('click', () => {
      alert.style.display = 'none';
    })
      AfficherHist2();
    const dashHistorique = document.querySelector('[data-bs-target="#dash-historique"]');
if (dashHistorique) {
    dashHistorique.click();
}

    } catch (err) {
  console.error(err);
  if (alert) {
    alert.textContent = 'Erreur inattendue, réessayez plus tard.';
    alert.style.display = 'block';
  } else {
    console.error('Alert element not found.');
  }
}
  });
});



async function AfficherHist2() {
  const token = localStorage.getItem('token');
  if (!token) {
    alert('Vous devez être connecté pour voir votre historique.');
    return window.location.href = '/connexion-Ecoride.html';
  }

  const res = await fetch('/api/trajets/historique', {
    method: 'GET',
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": `Bearer ${token}`,
    },
  });

  if (!res.ok) {
    const raw = await res.text();
    console.error("Réponse brute /api/trajets/historique :", raw);
    return alert(`Erreur d'historique : ${res.status}`);
  }

  const trajets = await res.json();
  const tbody = document.getElementById('users-hist-2');
  tbody.innerHTML = '';

  trajets.forEach(t => {
    const [yyy, mm, ddTime] = t.date_creation.split('-');
    const dd = ddTime.split(' ')[0];
    const dateFr = `${dd}/${mm}/${yyy}`;
    const timeDep = t.heure_depart.split(' ')[1].slice(0,5);
    const timeArr = t.heure_arrivee.split(' ')[1].slice(0,5);

    let startButtonHTML = '';
    let cancelButtonHTML = '';

    if (t.statut_trajet === "annule" || t.statut_trajet === "termine") {
      startButtonHTML = '';
      cancelButtonHTML = '';
    } else if (t.statut_trajet === "en_cours") {
      startButtonHTML = `<button class="btn btn-sm btn-neutral start-btn">Terminer</button>`;
      cancelButtonHTML = `<button class="btn btn-sm btn-danger cancel-btn">Annuler</button>`;
    } else {
      startButtonHTML = `<button class="btn btn-sm btn-neutral start-btn">Démarrer</button>`;
      cancelButtonHTML = `<button class="btn btn-sm btn-danger cancel-btn">Annuler</button>`;
    }

    tbody.innerHTML += `
      <tr data-id="${t.id}">
        <td>${t.ville_depart} → ${t.ville_arrivee}</td>
        <td>${dateFr}</td>
        <td>${timeDep}</td>
        <td>${timeArr}</td>
        <td>${t.passagers ?? t.places_disponibles}</td>
        <td>${t.vehicule ? t.vehicule.marque + ' ' + t.vehicule.modele : ''}</td>
        <td>${t.prix_credits}</td>
        <td class="status text-end">${t.statut_trajet}</td>
        <td>${startButtonHTML} ${cancelButtonHTML}</td>
      </tr>
    `;
  });
}

document.getElementById('users-hist-2').addEventListener('click', async (e) => {
  const button = e.target;
  const row = button.closest('tr');
  if (!row) return;
  const trajetId = row.dataset.id;

  if (button.classList.contains('start-btn')) {
    let newStatus = '';
    if (button.textContent === 'Démarrer') {
      newStatus = 'En cours';
    } else if (button.textContent === 'Terminer') {
      newStatus = 'Terminé';
    }

    const res = await fetch(`/api/trajets/${trajetId}/changer-statut`, {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ statut: newStatus }),
    });

    if (res.ok) {
      await AfficherHist2(); 
    } else {
      alert("Erreur lors du changement de statut.");
    }
  }

  if (button.classList.contains('cancel-btn')) {
    const res = await fetch(`/api/trajets/${trajetId}/changer-statut`, {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ statut: 'Annulé' }),
    });

    if (res.ok) {
      await AfficherHist2();
    } else {
      alert("Erreur lors de l'annulation.");
    }
  }
});








async function AfficherVoit() {
  const userId = localStorage.getItem('userId');
  const token  = localStorage.getItem('token');
  if (!userId || !token) return;

  const res = await fetch(`/api/vehicules/${userId}`, {
    headers: {
      'Accept':        'application/json',
      'Authorization': `Bearer ${token}`
    }
  });

  if (!res.ok) {
    console.error('Vehicules load error', res.status);
    return;
  }
  const vehicules = await res.json();
  const container = document.getElementById('users-Voit');
  container.innerHTML = '';
  vehicules.forEach(v => {
    container.innerHTML += `
  <tr>
    <td>${v.immatriculation}</td>
    <td>${v.date_premiere_immatriculation}</td>
    <td>${v.modele}</td>
    <td>${v.couleur}</td>
    <td>${v.marque}</td>
    <td>${v.nombre_places}</td>
    <td>${v.type_energie}</td>
    <td>${v.fumeur ? 'Oui' : 'Non'}</td>
    <td>${v.animaux ? 'Oui' : 'Non'}</td>
    <td>${v.voyage_ecologique ? 'Oui' : 'Non'}</td>
    <td><button class="btn btn-sm btn-danger supprimer-vehicule-btn" data-id="${v.id}">Supprimer</button></td>
  </tr>
`;
  });
  
  document.getElementById("vos_vehicules").textContent = vehicules.length;
}

document.addEventListener("click", function (e) {
  if (e.target.classList.contains("supprimer-vehicule-btn")) {
    e.preventDefault();

    const id = e.target.dataset.id;
    const token = localStorage.getItem("token");

    if (!id) {
      alert("ID du véhicule manquant !");
      return;
    }

    const confirmation = confirm(
      " Cette action supprimera ce véhicule, tous les trajets associés et les participants. Continuer ?"
    );

    if (confirmation) {
      fetch(`/api/vehicules/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: "Bearer " + token,
          Accept: "application/json"
        }
      })
        .then(async res => {
          if (!res.ok) {
            const errorData = await res.json();
            throw new Error(errorData.message || "Erreur inconnue");
          }
          return res.json();
        })
        .then(data => {
          alert(data.message);
          AfficherVoit();
        })
        .catch(err => {
          console.error("Erreur suppression :", err);
          alert("Erreur lors de la suppression : " + err.message);
        });
    }
  }
});



document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('vehicule-form');
    if (!form) {
        console.error('form #vehicule-form introuvable');
        return;
    }

    form.addEventListener('submit', async e => {
        e.preventDefault();

        const token = localStorage.getItem('token');
        if (!token) {
            alert('Vous devez être connecté pour ajouter un véhicule');
            return window.location.href = '/login-02.html';
        }

        const data = {
            immatriculation: form.querySelector('[name="immatriculation"]').value,
            date_premiere_immatriculation: form.querySelector('[name="date_premiere_immatriculation"]').value,
            marque: form.querySelector('[name="marque"]').value,
            modele: form.querySelector('[name="modele"]').value,
            couleur: form.querySelector('[name="couleur"]').value,
            nombre_places: parseInt(form.querySelector('[name="nombre_places"]').value, 10),
            type_energie: form.querySelector('select[name="type_energie"]').value,
            fumeur: form.querySelector('input[name="fumeur"]').checked ? 1 : 0,
            animaux: form.querySelector('input[name="animaux"]').checked ? 1 : 0,
            voyage_ecologique: form.querySelector('input[name="voyage_ecologique"]').checked ? 1 : 0,
            preferences: form.querySelector('textarea[name="preferences"]').value || null
        };

        console.log("Data envoyée :", data);
        console.log("fumeur value : ", form.querySelector('input[name="fumeur"]').checked);

      try {
    const res = await fetch('/api/vehicules', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify(data)
    });

    if (res.status === 422) {
        const err = await res.json();
        const first = Object.values(err.errors)[0][0];
        return alert('Erreur d\'envoi véhicule : ' + first);
    }

    if (!res.ok) {
        return alert('Erreur réseau : ' + res.status);
    }

    alert('Véhicule ajouté avec succès !');
    form.reset();

} catch (error) {
    console.error('Erreur lors de l\'envoi :', error);
    alert('Erreur technique lors de l\'envoi');
}
    AfficherVoit(); 
  })
});




function remove() {
  const removebutton = document.getElementById("removebutton");

  removebutton.addEventListener('click', () => {
    const confirmDelete = confirm("Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible.");
    if (confirmDelete) {
      const token = localStorage.getItem("token");
      const utilisateurId = localStorage.getItem("userId");

      fetch(`/api/utilisateur/${utilisateurId}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`
        }
      })
      .then(response => {
       if (response.ok) {
        localStorage.removeItem("token");
        localStorage.removeItem("role");
        localStorage.removeItem("userId");
        alert("Compte supprimé.");
        window.location.href = "/index.html";
        } else {
          alert("Erreur lors de la suppression.");
        }
      })
      .catch(error => {
        console.error(error);
        alert("Erreur réseau.");
      });
    }
  });
}
document.addEventListener("DOMContentLoaded", remove);




async function fetchUserInfo() {

  const token = localStorage.getItem('token');
  if (!token) {
    alert('Vous devez vous reconnecter.');
    return window.location.href = '/login-02.html';
  }

  
  const res = await fetch('/api/user-info', {
    method: 'GET',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json'
    }
  });

  
  if (!res.ok) {
    alert('Session expirée ou non autorisé');
    return window.location.href = '/login-02.html';
  }


  const { utilisateur } = await res.json();
  document.getElementById('userName').textContent     = `Bonjour ${utilisateur.prenom} ! Bienvenue sur votre profile.`;
  document.getElementById('userFullName').textContent = `${utilisateur.prenom} ${utilisateur.nom}`;
  document.getElementById('userEmail').textContent    = utilisateur.email;
  document.getElementById('userPhoto').src = "/storage/" + utilisateur.photo;
 
  localStorage.setItem('userId', utilisateur.id);
}


document.addEventListener('DOMContentLoaded', () => {
  fetchUserInfo();
  AfficherHist2();
  AfficherVoit();
  remove();
});


document.addEventListener("DOMContentLoaded", () => {
    const token = localStorage.getItem("token"); 

    fetch("/api/user/credits", {
        headers: {
            "Accept": "application/json",
            "Authorization": "Bearer " + token
        }
    })
    .then(response => {
        if (!response.ok) throw new Error("Erreur API " + response.status);
        return response.json();
    })
    .then(data => {
        document.getElementById("credits").textContent = data.credits;
    })
    .catch(error => console.error(error));
});



document.addEventListener("DOMContentLoaded", () => {
    const token = localStorage.getItem("token");

    fetch("/api/trajets/conducteur", {
        headers: {
            "Accept": "application/json",
            "Authorization": "Bearer " + token
        }
    })
    .then(response => {
        if (!response.ok) throw new Error("Erreur API " + response.status);
        return response.json();
    })
    .then(data => {
        document.getElementById("trajet_conducteur").textContent = data.count;
    })
    .catch(error => console.error(error));
});

document.addEventListener("DOMContentLoaded", () => {
  const decoBtn = document.getElementById("deco");

  if (decoBtn) {
    decoBtn.addEventListener("click", () => {
   
      localStorage.removeItem("token");
      localStorage.removeItem("role");

      
      window.location.href = "/index01.html";
    });
  }
});


async function chargerConducteurs() {
    try {
        const res = await fetch('/api/utilisateurs/conducteurs', {
            headers: { "Accept": "application/json" }
        });
        const conducteurs = await res.json();
        const select = document.getElementById("conducteur_id");
        conducteurs.forEach(c => {
            select.innerHTML += `<option value="${c.id}">${c.prenom} ${c.nom}</option>`;
        });
    } catch (e) {
        console.error(e);
        alert("Erreur lors du chargement des conducteurs.");
    }
}
document.addEventListener("DOMContentLoaded", chargerConducteurs);


document.getElementById("Avis_Chauff-form").addEventListener("submit", async function (e) {
    e.preventDefault();

    const token = localStorage.getItem("token");
    if (!token) {
        alert("Vous devez être connecté pour envoyer un avis.");
        return;
    }

    const data = {
        trajet: document.querySelector('input[name="Trajet"]').value,
        passager_id: localStorage.getItem("userId"), 
        conducteur_id: document.querySelector('select[name="conducteur_id"]').value,
        note: document.querySelector('input[name="note"]').value,
        commentaire: document.querySelector('textarea[name="commentaire"]').value,
        ponctualite: document.querySelector('select[name="ponctualite"]').value,
        conduite_securisee: document.querySelector('input[name="securite"]:checked').value === "oui" ? 1 : 0,
        recommande: document.querySelector('input[name="recommande"]:checked').value === "oui" ? 1 : 0
    };

    try {
        const res = await fetch("/api/avis", {
            method: "POST",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`,
            },
            body: JSON.stringify(data)
        });

        const result = await res.json();
        if (!res.ok) {
            throw new Error(result.message || "Erreur lors de l'envoi de l'avis");
        }

        alert("Avis envoyé avec succès !");
        e.target.reset();

    } catch (error) {
        console.error(error);
        alert("Impossible d'envoyer l'avis.");
    }
});




async function chargerConducteurs2() {
    try {
        const res = await fetch('/api/utilisateurs/conducteurs', {
            headers: { "Accept": "application/json" }
        });
        const conducteurs = await res.json();
        const select = document.getElementById("conducteur_id2");
        conducteurs.forEach(c => {
            select.innerHTML += `<option value="${c.id}">${c.prenom} ${c.nom}</option>`;
        });
    } catch (e) {
        console.error(e);
        alert("Erreur lors du chargement des conducteurs.");
    }
}
document.addEventListener("DOMContentLoaded", chargerConducteurs2);

async function chargerTrajets() {
  try {
    const res = await fetch("/api/trajets");
    const trajets = await res.json();
    const select = document.getElementById("trajet_id");
    trajets.forEach(t => {
      select.innerHTML += `<option value="${t.id}">${t.ville_depart} → ${t.ville_arrivee} (${t.date_depart})</option>`;
    });
  } catch(e) {
    console.error(e);
  }
}
document.addEventListener("DOMContentLoaded", chargerTrajets);

  document.getElementById("incident-form").addEventListener("submit", async function (e) {
    e.preventDefault();

    const data = {
      utilisateur_id: localStorage.getItem("userId"),
      conducteur_id: localStorage.getItem("conducteur_id"),
      trajet_id: document.querySelector('[name="trajet_id"]').value,
      date_depart: document.querySelector('[name="date"]').value,
      heure_depart: document.querySelector('[name="Heure_D"]').value,
      heure_arrivee: document.querySelector('[name="Heure_A"]').value,
      message: document.querySelector('[name="message"]').value,
    };

    console.log(data);

    try {
      const token = localStorage.getItem("token");
        const alert = document.getElementById("Alert3");

      const res = await fetch("/api/incidents", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${token}`,
        },
        body: JSON.stringify(data),
      });

      if (!res.ok) throw new Error("Erreur lors de l'envoi");

       alert.style.display = 'block';
        document.addEventListener('click', () => {
      alert.style.display = 'none';
    })

      alert("Incident transmis avec succès");
    } catch (error) {
      console.error(error);
      alert("Erreur lors de l'enregistrement de l'incident");
    }
  });


  function butclose() {
    const but1 = document.getElementById("close1");
    const alert1 = document.getElementById("alert1");

    if (but1 && alert1) {
        but1.addEventListener("click", () => {
            alert1.style.display = 'none';
        });
    }
}
butclose();


  document.getElementById('uploadPhotoBtn').addEventListener('click', async () => {
    const fileInput = document.getElementById('photoInput');
    const file = fileInput.files[0];
    
    if (!file) {
        alert("Veuillez sélectionner une photo.");
        return;
    }

    const formData = new FormData();
    formData.append('photo', file);

    const token = localStorage.getItem('token'); 

    try {
        const response = await fetch('/api/utilisateur/photo', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`
            },
            body: formData
        });

        const data = await response.json();

        if (response.ok) {
            document.getElementById('userPhoto').src = data.photo_url + '?t=' + new Date().getTime();

        } else {
            alert(data.message || "Erreur lors de la mise à jour de la photo.");
        }
    } catch (error) {
        console.error(error);
        alert("Erreur réseau.");
    }
});
