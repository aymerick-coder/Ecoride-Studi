function validate(event) {
  event.preventDefault();
    const name = document.getElementById("name").value
    const mail = document.getElementById("email").value
    const password = document.getElementById("password").value
    const passe = document.getElementById("passe").value

    if(name == "") {
        document.getElementById("name").style.borderColor = "red";
        document.getElementById("Message").style.color= "red";
        document.getElementById("Message").innerHTML = "Veuillez entrez votre Nom et Prénom";
        return false;
    }

    else if(mail == "") {
        document.getElementById("email").style.borderColor = "red";
        document.getElementById("Message1").style.color= "red";
        document.getElementById("Message1").innerHTML = "Veuillez entrez votre adresse email";
        return false;
    }

    else if(password == "") {
        document.getElementById("password").style.borderColor = "red";
        document.getElementById("Message2").style.color= "red";
        document.getElementById("Message2").innerHTML = "Veuillez entrez votre mot de passe";
        return false;
    }

    else if(passe == "") {
        document.getElementById("passe").style.borderColor = "red";
        document.getElementById("Message3").style.color= "red";
        document.getElementById("Message3").innerHTML = "Veuillez entrez a nouveau votre mot de passe";
        return false;
    }

    else if(password !== passe) {
        document.getElementById("password" && "passe").style.borderColor = "red";
        document.getElementById("Message4").style.color= "red";
        document.getElementById("Message4").innerHTML = "Les mots de passe ne correspondent pas";
        return false;
    }
    
    else {
        document.getElementById("name").style.borderColor = "";
        document.getElementById("Message").style.color= "";
        document.getElementById("Message").innerHTML = "";
        document.getElementById("email").style.borderColor = "";
        document.getElementById("Message1").style.color= "";
        document.getElementById("Message1").innerHTML = "";
        document.getElementById("password").style.borderColor = "";
        document.getElementById("Message2").style.color= "";
        document.getElementById("Message2").innerHTML = "";
        document.getElementById("passe").style.borderColor = "";
        document.getElementById("Message3").style.color= "";
        document.getElementById("Message3").innerHTML = "";
        document.getElementById("password" && "passe").style.borderColor = "";
        document.getElementById("Message4").style.color= "";
        document.getElementById("Message4").innerHTML = "";
        return true;
        
    }
};

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("creaform");
  const mdpInput = document.getElementById("password");
  const message = document.getElementById("Message2");

  form.addEventListener("submit", function (event) {
    const mdp = mdpInput.value;

    const longueurOK = mdp.length >= 8;
    const lettreOK = /[a-zA-Z]/.test(mdp);
    const chiffreOK = /[0-9]/.test(mdp);
    const specialOK = /[!@#\$%\^\&*\)\(+=._-]/.test(mdp);

    if (!longueurOK || !lettreOK || !chiffreOK || !specialOK) {
      event.preventDefault();
      message.innerText = "Le mot de passe doit contenir au moins 8 caractères, une lettre, un chiffre et un caractère spécial.";
         document.getElementById("Message2").style.color= "red";
         return false;
    } else {
      message.innerText = "";
      return true;
    }
  });
});


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



document
  .getElementById("creaform")
  .addEventListener("submit", async function (e) {
    e.preventDefault();

    const creaform = e.target;
    const formData = new FormData(creaform);

    const email = creaform.querySelector('[name="email"]').value;
    const password = creaform.querySelector('[name="password"]').value;

    try {
      const response = await fetch('/api/inscription', {
        method: 'POST',
        headers: {
          'Accept': 'application/json'
        },
        body: formData
      });

      const result = await response.json();
      localStorage.clear();

      if (response.ok) {
        console.log("Inscription réussie, tentative de connexion…");

        const loginResponse = await fetch("/api/connexion", {
          method: "POST",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          credentials: "include",
          body: JSON.stringify({ email, password })
        });

        const loginResult = await loginResponse.json();

        if (loginResponse.ok) {
          localStorage.setItem("prenom", loginResult.utilisateur.prenom);
          localStorage.setItem("email", loginResult.utilisateur.email);
          localStorage.setItem("userId", loginResult.utilisateur.id);
          localStorage.setItem("user", JSON.stringify(loginResult.utilisateur));
          localStorage.setItem("token", loginResult.token);

          window.location.href = "dashboard/user-dashboard.html";
        } else {
          alert("Connexion après inscription échouée : " + (loginResult.message || "Erreur inconnue"));
        }

      } else {
        document.getElementById('resultat').innerHTML =
          'Erreur : ' + (result.message || JSON.stringify(result));
      }

    } catch (error) {
      document.getElementById('resultat').innerHTML =
        'Erreur réseau : ' + error.message;
    }
  });



var cd;

$(function(){
  CreateCaptcha();
});

function CreateCaptcha() {

  var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
                    
  var i;
  for (i = 0; i < 6; i++) {
    var a = alpha[Math.floor(Math.random() * alpha.length)];
    var b = alpha[Math.floor(Math.random() * alpha.length)];
    var c = alpha[Math.floor(Math.random() * alpha.length)];
    var d = alpha[Math.floor(Math.random() * alpha.length)];
    var e = alpha[Math.floor(Math.random() * alpha.length)];
    var f = alpha[Math.floor(Math.random() * alpha.length)];
  }
  cd = a + ' ' + b + ' ' + c + ' ' + d + ' ' + e + ' ' + f;
  $('#CaptchaImageCode').empty().append('<canvas id="CapCode" class="capcode" width="300" height="80"></canvas>')
  
  var c = document.getElementById("CapCode"),
      ctx=c.getContext("2d"),
      x = c.width / 2,
      img = new Image();

  img.src = "https://usiseane.sirv.com/binary-numbers-pattern.jpg";
  img.onload = function () {
      var pattern = ctx.createPattern(img, "repeat");
      ctx.globalAlpha = "0.7";
      ctx.fillStyle = pattern;
      ctx.fillRect(0, 0, c.width, c.height);
      ctx.font="52px Roboto";
      ctx.fillStyle = 'lightgreen';
      ctx.textAlign = 'center';
      ctx.setTransform (1, -0.12, 0, 1, 0, 15);
      ctx.fillText(cd,x,55);
  };
  
}

function roundRect(ctx, x, y, width, height, radius, fill, stroke) {
  if (typeof stroke === 'undefined') {
    stroke = true;
  }
  if (typeof radius === 'undefined') {
    radius = 5;
  }
  if (typeof radius === 'number') {
    radius = {tl: radius, tr: radius, br: radius, bl: radius};
  } else {
    var defaultRadius = {tl: 0, tr: 0, br: 0, bl: 0};
    for (var side in defaultRadius) {
      radius[side] = radius[side] || defaultRadius[side];
    }
  }
  ctx.beginPath();
  ctx.moveTo(x + radius.tl, y);
  ctx.lineTo(x + width - radius.tr, y);
  ctx.quadraticCurveTo(x + width, y, x + width, y + radius.tr);
  ctx.lineTo(x + width, y + height - radius.br);
  ctx.quadraticCurveTo(x + width, y + height, x + width - radius.br, y + height);
  ctx.lineTo(x + radius.bl, y + height);
  ctx.quadraticCurveTo(x, y + height, x, y + height - radius.bl);
  ctx.lineTo(x, y + radius.tl);
  ctx.quadraticCurveTo(x, y, x + radius.tl, y);
  ctx.closePath();
  if (fill) {
    ctx.fill();
  }
  if (stroke) {
    ctx.stroke();
  }

}
