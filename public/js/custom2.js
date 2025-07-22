$('.datepicker').datepicker({
   startDate: new Date(),
     todayHighlight: true,
     format: 'dd/mm/yyyy',
     orientation: "bottom",
     beforeShowDay: function (date) {
       console.log("Runned");
       var today = new Date();
      var sameMonth = date.getMonth() === today.getMonth();
       var sameYear = date.getFullYear() === today.getFullYear();
       return {
         enabled: sameMonth && sameYear,
       };
     },
   });

document.addEventListener("DOMContentLoaded", () => {
  const token = localStorage.getItem("token");
  const userStr = localStorage.getItem("user");
  const button = document.getElementById("create_button1");
  const mobilebutton = document.getElementById("create_button-mobile");
  let role = null;

  if (userStr) {
    try {
      const user = JSON.parse(userStr);
      role = user.role || 'user';
    } catch (e) {
      console.error("Impossible de parser le user depuis le localStorage");
    }
  }

  if (token && role) {
    const links = document.querySelectorAll("ul.nav-menu li a")

    links.forEach(link => {
      if (link.textContent.includes("Connexion")) {
        if (role === "admin") {
          link.textContent = "Administration";
          link.href = "dashboard/admin-dashboard.html";
         if (button) button.style.display = 'none';
          if (mobilebutton) mobilebutton.style.display = 'none';
        } else if (role === "employee") {
          link.textContent = "Tableau de bord";
          link.href = "dashboard/employee-dashboard.html";
          if (button) button.style.display = 'none';
           if (mobilebutton) mobilebutton.style.display = 'none';
        }else {
          link.textContent = "Mon compte";
          link.href = "dashboard/user-dashboard.html";
         if (button) button.style.display = 'none';
         if (mobilebutton) mobilebutton.style.display = 'none';
        }
      }
    });
  }
});




document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.querySelector('.kode-search-menu input');
    const modalElement = document.getElementById('search');

    if (searchInput && modalElement) {
        searchInput.addEventListener('click', () => {
           
            modalElement.removeAttribute('aria-hidden');

            const searchModal = new bootstrap.Modal(modalElement);
            searchModal.show();
        });
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const searchModal = document.getElementById('search');

    if (searchModal) {
        searchModal.addEventListener('hidden.bs.modal', () => {
            document.body.style.paddingRight = '0px';
        });

        searchModal.addEventListener('shown.bs.modal', () => {
            document.body.style.paddingRight = '0px';
        });
    }
});


$(document).ready(function(){
    $('#kode-responsive-navigation').dlmenu({
        animationClasses : { classin : 'dl-animate-in-2', classout : 'dl-animate-out-2' }
    });
});
