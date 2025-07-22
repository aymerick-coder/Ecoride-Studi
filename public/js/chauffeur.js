document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const boutonMessage = document.getElementById("btn-message");
    const id = params.get("id");
    const trajetId = params.get("trajet_id"); 

    console.log("param id =>", id);
    console.log("trajet id =>", trajetId);

    if (!id) {
        alert("Aucun ID fourni");
        return;
    }

    fetch(`/api/chauffeurs/${id}`)
        .then(response => response.json())
        .then(chauffeur => {
            document.querySelector(".chauffeur-nom").textContent = `${chauffeur.nom} ${chauffeur.prenom}`;
            document.querySelector(".chauffeur-email").textContent = chauffeur.email;
            document.querySelector(".chauffeur-preferences").textContent = chauffeur.preferences ?? "Non renseigné";

            let vehicule = chauffeur.vehicule; 
           if (trajetId && chauffeur.trajets) {
    const trajet = chauffeur.trajets.find(t => t.id == trajetId);
    if (trajet?.vehicule) {
        vehicule = trajet.vehicule; 
    }
}

            document.querySelector(".chauffeur-modele").textContent = vehicule?.modele ?? "Non renseigné";
            document.querySelector(".chauffeur-marque").textContent = vehicule?.marque ?? "Non renseigné";
            document.querySelector(".chauffeur-energie").textContent = vehicule?.type_energie ?? "Non renseigné";
        })
        .catch(error => {
            console.error("Erreur API chauffeur:", error);
            alert("Impossible de charger le profil chauffeur");
        });

    boutonMessage?.addEventListener("click", async () => {
        try {
            const res = await fetch(`/api/chauffeurs/${id}`, {
                headers: { 'Accept': 'application/json' }
            });
            if (!res.ok) throw new Error("Erreur API");
            const chauffeur = await res.json();
            window.location.href = `mailto:${chauffeur.email}`;
        } catch (e) {
            console.error("Erreur lors de la récupération du mail :", e);
            alert("Une erreur est survenue");
        }
    });

    const butback = document.getElementById("back");
    butback?.addEventListener('click', () => {
        window.history.back();
    });

    chargerAvisChauffeur();
});


async function chargerAvisChauffeur() {
    const params = new URLSearchParams(window.location.search);
    const conducteurId = params.get("id");

    try {
        const res = await fetch(`/api/avis/chauffeur/${conducteurId}`);
        const avis = await res.json();

        const container = document.getElementById("avisChauffeur");
        const M = document.getElementById("textA");

        container.innerHTML = "";
        if (avis.length === 0) {
            M.textContent = "Aucun avis disponible pour ce chauffeur pour le moment";
        }

        avis.forEach(a => {
            container.innerHTML += `
                <div class='carousel__item'>
                    <div class='carousel__item-head'>
                        <img src="https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-512.png" style="width: 100px;">
                    </div>
                    <div class='carousel__item-body'>
                        <p class="title">${a.passager_prenom} ${a.passager_nom}</p>
                        <p>${a.commentaire}</p>
                    </div>
                </div>
            `;
        });
    } catch (error) {
        console.error("Erreur lors du chargement des avis :", error);
    }
}
