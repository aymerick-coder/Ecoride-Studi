async function chargerReservationsAdmin() {
    try {
        const token = localStorage.getItem("token");
        const res = await fetch("/api/admin/reservations", {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();

        const tbody = document.getElementById("Reservations");
        tbody.innerHTML = "";

        data.forEach(item => {
            tbody.innerHTML += `
                <tr>
                    <td>${item.passager_nom}</td>
                    <td>${item.chauffeur_nom}</td>
                    <td>${item.ville_depart} - ${item.ville_arrivee}</td>
                    <td>${item.date}</td>
                    <td>${item.heure_depart}</td>
                    <td>${item.heure_arrivee}</td>
                    <td>${item.passager_email}</td>
                    <td>${item.chauffeur_email}</td>
                </tr>
            `;
        });

    } catch(e) {
        console.error("Erreur chargement réservations admin :", e);
    }
}
document.addEventListener("DOMContentLoaded", chargerReservationsAdmin);





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



                            
