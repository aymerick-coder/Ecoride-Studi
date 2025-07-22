decisions = [];

  function setCookie(name, value, days) {
    const expires = new Date(Date.now() + days * 864e5).toUTCString();
    document.cookie = `${name}=${encodeURIComponent(value)}; expires=${expires}; path=/`;
  }

  function getCookie(name) {
    return document.cookie
      .split('; ')
      .find(row => row.startsWith(name + '='))
      ?.split('=')[1] || '';
  }

  document.addEventListener("DOMContentLoaded", () => {
    const banner = document.querySelector(".cookie-consent");
    const consent = getCookie("user_cookie_consent");

    if (consent === "accepted" || consent === "rejected") {
      console.log("Consentement déjà enregistré :", consent);
      return;
    }

    setTimeout(() => {
      banner.style.display = "block";
      banner.classList.add("-deploy");
    }, 1000);

    document.getElementById("accept").addEventListener("click", () => {
      setCookie("user_cookie_consent", "accepted", 365);
      decisions.push("accepted");
      console.log("Décisions enregistrées :", decisions);
      banner.style.display = "none";
    });

    document.getElementById("refus").addEventListener("click", () => {
      setCookie("user_cookie_consent", "rejected", 365);
      decisions.push("rejected");
      console.log("Décisions enregistrées :", decisions);
      banner.style.display = "none";
    });
  });



document.getElementById('range').addEventListener('input', e=>{
  document.querySelector('.graph-container').style.setProperty('--rating', e.target.value);
})


$(document).ready(function() {
  $(".smiley").on("click", function() {
    $(".smiley").toggleClass("blink");
  });
});


function SuccesM() {
  document.addEventListener('DOMContentLoaded', () => {
    const containerHappy = document.getElementById('happysmil');
    const form = document.getElementById('feedback');
    const T = document.getElementById("CacheT");

    console.log('Test');

    form.addEventListener('submit', (event) => {
        event.preventDefault(); 
        containerHappy.style.display = 'block'; 
        form.style.display = 'none';
        T.style.display = 'none';
    });
});
}
SuccesM();



function AvisForm() {
  const Avisbutton = document.getElementById("Avis_button1");

  Avisbutton.addEventListener('click', () => {
    window.open("Avis.html");
  });
}
AvisForm();

async function AfficherAvis() {
  try {
    const reponse = await fetch("/api/avis-plateforme");
    const result = await reponse.json();

    const container = document.getElementById("UserAvis");
    container.innerHTML = "";

    result.forEach(Avis => {
      let icone = "";

      switch (Avis.note) {
        case 0:
        case 1:
          icone = '<i id="nul" class="fa-regular fa-face-grimace"></i>';
          break;

        case 2:
          icone = '<i id="pas bon" class="fa-regular fa-face-frown"></i>';
          break;

        case 3:
          icone = '<i id="satisfait" class="fa-regular fa-face-meh"></i>';
          break;

        case 4:
          icone = '<i id="bien" class="fa-regular fa-face-smile"></i>';
          break;

        case 5:
          icone = '<i id="très bien" class="fa-regular fa-face-grin-hearts"></i>';
          break;

        default:
          icone = '<i class="fa-regular fa-circle-question"></i>';
          break;
      }

      container.innerHTML += `
        <tr>
          <td>${Avis.nom_prenom}</td>
          <td>${Avis.email}</td>
          <td>${icone}</td>
          <td>${Avis.note}</td>
          <td>${Avis.message}</td>
          <td class="text-end">
            <a href="#" class="btn btn-sm btn-neutral">Accepter</a>
            <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
              <i title="Refuser" class="bi bi-trash"></i>
            </button>
          </td>
        </tr>
      `;
    });
  } catch (error) {
    console.error("Erreur lors de l’affichage des avis :", error);
  }
}

window.addEventListener('DOMContentLoaded', AfficherAvis);
