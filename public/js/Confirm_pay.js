document.addEventListener("DOMContentLoaded", () => {
  const urlParams = new URLSearchParams(window.location.search);
  const trajetId = urlParams.get('trajetId');
  console.log("trajetId récupéré :", trajetId);

  const confirmerButton = document.getElementById("Cbutton1");
  const refuserButton = document.getElementById("Cbutton2");
  const conf = document.getElementById("confirmation");

  confirmerButton.addEventListener("click", async () => {
     const token = localStorage.getItem('token');
    console.log("TOKEN:", token);

    if (!token) {
        alert("Vous devez vous connecter ou créer un compte pour participer à ce covoiturage.");
        window.location.href = "login-02.html";  
        return;
    }

    try {
      const res = await fetch(`/api/trajets/${trajetId}/participer`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        }
      });

      const data = await res.json();

      if (res.ok) {
        conf.style.display  = 'none';
        confirmerButton.style.display  = 'none';
        refuserButton.style.display  = 'none';
  
        const container = document.getElementById("load");
        const container2 = document.getElementById("S");

        container2.innerHTML = "Vous avez confirmé le paiement...";
        container.innerHTML = `
          <div class="spinner-border" role="status">
            <span class="visually-hidden">Loading...</span>
          </div>
        `;

        setTimeout(() => {
          container2.innerHTML = "Veuillez patienter...";
        }, 5000);

       setTimeout(() => {
  if (window.opener && !window.opener.closed) {
    window.opener.location.reload();
  }
  window.close();
}, 10000);

      } else {
        window.alert(data.message || "Erreur lors de la participation");
        window.close();
      }

    } catch (err) {
      console.error(err);
      window.alert("Erreur réseau");
      window.close();
    }
  });

  refuserButton.addEventListener("click", () => {
    window.close();
  });
});
