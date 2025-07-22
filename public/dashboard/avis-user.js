async function AfficherAvis() {
let reponse = await fetch("/api/avis-plateforme");
let result = await reponse.json();

    const container = document.getElementById("UserAvis");
    container.innerHTML = "";



   result.forEach(Avis => {

  let icone = '';
  switch (parseInt(Avis.note)) {
    case 1:
      icone = '<i class="fa-regular fa-face-frown"></i>'; 
      break;
    case 2:
      icone = '<i class="fa-regular fa-face-meh"></i>'; 
      break;
    case 3:
      icone = '<i class="fa-regular fa-face-smile"></i>'; 
      break;
    case 4:
      icone = '<i class="fa-regular fa-face-grin-hearts"></i>'; 
      break;
    case 5:
      icone = '<i class="fa-solid fa-star"></i>'; 
      break;
    default:
      icone = '<i class="fa-regular fa-face-meh-blank"></i>'; 
  }

  container.innerHTML += `
    <tr>
      <td>${Avis.nom_prenom}</td>
      <td>${Avis.email}</td>
      <td>${Avis.note} ${icone}</td>
      <td>${Avis.message}</td>
   <td class="text-end">
      ${Avis.valide == 1
        ? `<span class="text-success fw-bold">Accepté</span>`
        : `<button onclick="validerAvis(${Avis.id})" class="btn btn-sm btn-success">Accepter</button>`
      }
      <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover" onclick="supprimerAvis(${Avis.id})">
        <i title="Refuser" class="bi bi-trash"></i>
      </button>
    </td>
  </tr>
  `;
});
 }
 document.addEventListener("DOMContentLoaded", AfficherAvis);




async function validerAvis(id) {
   const success = document.getElementById("alert1");
    try {
        const res = await fetch(`/api/avis-plateforme/${id}/valider`, {
            method: 'PUT',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });

        const data = await res.json();
        alert(data.message);
        alert(data.message);

const btn = document.querySelector(`button[onclick="validerAvis(${id})"]`);
if (btn) {
  btn.outerHTML = `<span class="text-success fw-bold">Accepté</span>`;
}

success.style.display = 'block';
            success.style.display = 'block';
        document.addEventListener('click', () => {
      success.style.display = 'none';
    })
    } catch (error) {
        console.error('Erreur validation avis', error);
    }
}




document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('feedback');
  const messageZone = document.getElementById('happysmil');

  if (!form) return;

  form.addEventListener('submit', async (event) => {
    event.preventDefault();

    const nom = document.getElementById('N').value;
    const email = document.getElementById('M').value;
    const note = document.getElementById('range').value;
    const message = document.getElementById('review').value;

    const data = {
      nom_prenom: nom,
      email: email,
      note: parseInt(note),
      message: message
    };

    try {
      const response = await fetch('/api/avis-plateforme', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });

      if (!response.ok) throw new Error("Erreur lors de l'envoi");

      
      form.style.display = 'none';
      messageZone.style.display = 'block';

    } catch (error) {
      alert("Une erreur est survenue : " + error.message);
      console.error(error);
    }
  });
});



async function supprimerAvis(id) {
  if (!confirm("Etes-vous certain de vouloir supprimer cet avis ?")) return;

  try {
    const response = await fetch(`/api/avis-plateforme/${id}`, {
      method: 'DELETE'
    });

    const result = await response.json();
    console.log(result);

    
    AfficherAvis();

  } catch (error) {
    console.error("Erreur suppression :", error);
    alert("Impossible de supprimer l’avis.");
  }
}



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
                        





