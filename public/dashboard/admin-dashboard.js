async function AfficherUsers() {
  try {
    const reponse = await fetch('/api/utilisateurs', {
      headers: { 'Accept': 'application/json' }
    });
    if (!reponse.ok) {
      throw new Error(`HTTP ${reponse.status}`);
    }
    const result = await reponse.json();

    const container = document.getElementById('UserList');
    container.innerHTML = '';

    result.forEach(user => {
      container.innerHTML += `
        <tr>
          <td>${user.nom}</td>
          <td>${user.prenom || ''}</td>
          <td>${user.email}</td>
          <td>${user.telephone}</td>
          <td>${user.adresse}</td>
          <td>${user.date_naissance}</td>
          <td>${user.photo}</td>
          <td>${user.credits}</td>
          <td class="text-end">
          <a class="btn btn-sm btn-neutral suspendre-btn" data-id="${user.id}">
            ${user.status === 'suspendu' ? 'Activer le compte' : 'Suspendre le compte'}
          </a>
             <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover supprimer-btn" title="Supprimer le compte"  data-id="${user.id}">
            <i class="bi bi-trash"></i>
    </button>
          </td>
        </tr>`;
    });
  } catch (err) {
    console.error('Erreur en chargeant les utilisateurs :', err);
  }


document.addEventListener("click", function(e) {
  if (e.target.matches(".suspendre-btn")) {
    e.preventDefault();
    const button = e.target;
    const id = button.dataset.id;
    const success = document.getElementById("alert1");
    const Mess = document.getElementById("Mcontainer");
    const token = localStorage.getItem("token");
    console.log("Bouton suspendre cliqué, ID=", id);

    fetch('/api/utilisateurs/suspendre/' + id, {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/json'
      }
    })
    .then(resp => resp.json())
    .then(data => {
      
      if (data.nouveau_status === "suspendu") {
        success.style.display = 'block';
        document.addEventListener('click', () => {
      success.style.display = 'none';
    })
        button.textContent = "Activer le compte";
      } else {
        button.textContent = "Suspendre le compte";
      }
         success.style.display = 'block';
        document.addEventListener('click', () => {
      success.style.display = 'none';
      Mess.innerText = "Le compte est de nouveau activé";
    })
    })
    .catch(console.error);
  }

    if (e.target.matches(".supprimer-btn, .supprimer-btn *")) {
        e.preventDefault();
        const button = e.target.closest(".supprimer-btn");
        const id = button.dataset.id;
        const token = localStorage.getItem("token");
        if (confirm("Confirmer la suppression ?")) {
            console.log("Bouton supprimer cliqué, ID=", id);
            fetch('/api/utilisateurs/' + id, {
                method: 'DELETE',
                headers: {
                    'Authorization': 'Bearer ' + token,
                    'Accept': 'application/json'
                }
            })
            .then(resp => resp.json())
            .then(data => {
                location.reload();
            })
            .catch(console.error);
        }
    }
});
}

document.addEventListener('DOMContentLoaded', AfficherUsers);





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





  fetch('/api/stats-globales')
  .then(res => res.json())
  .then(data => {
      console.log("Stats admin", data);

      document.getElementById('Credits_gagnes').textContent = data.credits;
      document.getElementById('reservations').textContent = data.reservations;
      document.getElementById('utilisateurs').textContent = data.utilisateurs;
      document.getElementById('chauffeurs').textContent = data.chauffeurs;
  })
  .catch(err => console.error(err));



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

                       














                            
                            
                                





























                            













