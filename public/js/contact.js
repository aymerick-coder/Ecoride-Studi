document.getElementById('message').addEventListener('input', e=>{
  document.querySelector('.graph-container').style.setProperty('--rating', e.target.value);
})


$(document).ready(function() {
  $(".smiley").on("click", function() {
    $(".smiley").toggleClass("blink");
  });
});


async function SuccesM(e) {
  e.preventDefault();  

  const form = document.getElementById('formulaire');
  const payload = {
    name:    form.name.value.trim(),
    email:   form.email.value.trim(),
    subject: form.subject.value.trim(),
    message: form.message.value.trim()
  };

  try {
    const res = await fetch('/api/contacts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    });

    if (!res.ok) {
      const err = await res.json().catch(()=>({}));
      throw new Error(err.message || res.status);
    }

  
    form.style.display        = 'none';
    document.getElementById('happysmil').style.display = 'block';

  } catch (err) {
    console.error(err);
    alert('Erreur à l’envoi : ' + err.message);
  }

  return false; 
}  document.getElementById("formulaire").addEventListener("submit", SuccesM);


async function AfficherMessages() {
  let reponse = await fetch("/api/contacts");
  let result = await reponse.json();

  const name = document.getElementById("name");
  const mail = document.getElementById("email");
  const object = document.getElementById("subject");
  const message = document.getElementById("message");

  const contact = {name, mail, object, message};

  const container = document.getElementById("UserMessages");
    container.innerHTML = "";

result.forEach(msg => {
  container.innerHTML += `
    <tr>
      <td>${msg.name}</td>
      <td>${new Date(msg.created_at).toLocaleString()}</td>
      <td>${msg.email}</td>
      <td>${msg.subject}</td>
      <td>${msg.message}</td>
      <td class="text-end">
        <a href="#" class="btn btn-sm btn-neutral">Répondre</a>
        <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover">
          <i title="Effacer" class="bi bi-trash"></i>
        </button>
      </td>
    </tr>
  `;
});

} document.addEventListener("DOMContentLoaded", AfficherMessages());


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