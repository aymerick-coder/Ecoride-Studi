document.addEventListener('DOMContentLoaded', async function() {
  try {
    const res  = await fetch('/api/contacts');
    if (!res.ok) throw new Error(res.status);
    const data = await res.json();

    const tbody = document.getElementById('UserMessages');
    tbody.innerHTML = ''; 

    data.forEach(msg => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${msg.name}</td>
        <td>${new Date(msg.created_at).toLocaleString()}</td>
        <td>${msg.email}</td>
        <td>${msg.subject}</td>
        <td>${msg.message}</td>
        <td>
        <a href="mailto:${msg.email}?subject=Ecoride - support"class="btn btn-sm btn-neutral">Repondre</a>
          <button class="btn btn-sm btn-danger" onclick="deleteMessage(${msg.id})">Supprimer</button>
        </td>
      `;
      tbody.appendChild(tr);
    });
  } catch (err) {
    console.error(err);
    alert('Impossible de récupérer les messages.');
  }
});


async function deleteMessage(id) {
  if (!confirm(" Etes vous sur de vouloir supprimer ce message ?")) return;
  try {
    const res = await fetch(`/api/contacts/${id}`, {
      method: "DELETE"
    });
    if (!res.ok) throw new Error("Erreur suppression");
    location.reload();
  } catch (err) {
    console.error(err);
    alert("Impossible de supprimer ce message.");
  }
};



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



