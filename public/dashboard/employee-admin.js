async function chargerEmployes() {
  try {
    const response = await fetch("/api/employees");
    const data = await response.json();

    const tableBody = document.getElementById("employeTableBody");
    tableBody.innerHTML = "";

    data.forEach(employe => {
      tableBody.innerHTML += `
        <tr>
          <td>${employe.id}</td>
          <td>${employe.nom}</td>
          <td>${employe.prenom}</td>
          <td>${employe.email}</td>
          <td class="statut-cell">${employe.status}</td>
          <td>
            <a href="#" class="btn btn-sm btn-neutral suspendre-btn" data-id="${employe.id}">
              ${employe.status === 'inactif' ? 'Réactiver le compte' : 'Suspendre le compte'}
            </a>
            <button class="btn btn-sm btn-danger supprimer-btn" data-id="${employe.id}">Supprimer</button>
          </td>
        </tr>
      `;
    });

  } catch (error) {
    console.error("Erreur lors du chargement des employés :", error);
  }
}

document.addEventListener("click", function(e) {
  if (e.target.matches(".suspendre-btn")) {
    e.preventDefault();
    const button = e.target;
    const id = button.dataset.id;
    const token = localStorage.getItem("token");
    const success = document.getElementById("alert1");
    const Mess = document.getElementById("Mcontainer");

    fetch('/api/employes/' + id + '/suspendre', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/json'
      }
    })
    .then(resp => resp.json())
    .then(data => {
      const newStatus = data.nouveau_status;
      const row = button.closest('tr');
      row.querySelector('.statut-cell').textContent = newStatus;

     button.textContent = newStatus === "inactif" ? "Réactiver le compte" : "Suspendre le compte";

success.textContent = newStatus === "inactif" ? "Le compte est maintenant suspendu" : "Le compte est maintenant activé";
      success.style.display = 'block';
      Mess.innerText = success.textContent;
      
      document.addEventListener('click', () => success.style.display = 'none', { once: true });
    })
    .catch(console.error);
  }

  if (e.target.matches(".supprimer-btn")) {
    e.preventDefault();
    const id = e.target.dataset.id;
    const token = localStorage.getItem("token");

    if (confirm("Supprimer ce compte employé ?")) {
      fetch('/api/employes/' + id, {
        method: 'DELETE',
        headers: {
          'Authorization': 'Bearer ' + token,
          'Accept': 'application/json'
        }
      })
      .then(resp => resp.json())
      .then(data => {
        alert(data.message);
        location.reload();
      })
      .catch(console.error);
    }
  }
});

window.addEventListener("DOMContentLoaded", chargerEmployes);



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

