function validerformulaire() {
const mail = document.getElementById("email").value;
const passe = document.getElementById("password").value;


if(mail == "") {
    document.getElementById("email").style.borderColor = "red";
    document.getElementById("message").style.color = "red";
    document.getElementById("message").innerHTML =("Veuillez entrez votre adresse email");
    return false;
}
else if(passe == "") {
    document.getElementById("password").style.borderColor = "red";
    document.getElementById("message2").style.color = "red";
    document.getElementById("message2").innerHTML =("Veuillez entrez votre mot de passe");
    return false;
}
else {
    document.getElementById("email").style.borderColor = "";
    document.getElementById("message").style.color = "";
    document.getElementById("message").innerHTML ="";
    document.getElementById("password").style.borderColor = "";
    document.getElementById("message2").style.color = "";
    document.getElementById("message2").innerHTML ="";
    return true;
}
}validerformulaire();



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


document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById("loginForm");

  form.addEventListener("submit", async e => {
    e.preventDefault();

    await fetch("/sanctum/csrf-cookie", { credentials: "include" });

    const email    = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    console.log("Envoi POST /api/connexion…", { email, password });
      
    const rawCookie = document.cookie
      .split('; ')
      .find(row => row.startsWith('XSRF-TOKEN='));

    const xsrfToken = decodeURIComponent(rawCookie.split('=')[1]);

    const res = await fetch("/api/connexion", {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "X-XSRF-TOKEN": xsrfToken
      },
      body: JSON.stringify({ email, password })
    });
    console.log("Réponse brute :", res);

    if (!res.ok) {
      const payload = await res.json().catch(() => ({}));
      return alert(payload.message || "Échec de la connexion");
    }

   const { utilisateur, token, role } = await res.json();
console.log("Connexion réussie :", utilisateur);

localStorage.setItem("token", token);
localStorage.setItem("user", JSON.stringify({ ...utilisateur, role }));

if (role === "admin") {
  window.location.href = "/dashboard/admin-dashboard.html";
} else if (role === "employee") {
  window.location.href = "/dashboard/employee-dashboard.html";
} else {
  window.location.href = "/dashboard/user-dashboard.html";
}
  });
});





