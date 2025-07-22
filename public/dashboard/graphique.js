(function($) {
  function generateBarGraph(wrapper) {
    var values = [];
    $(wrapper + ' .bar').each(function() {
      values.push($(this).data('value'));
    });
    var max_value = Math.max.apply(Math, values);

    $(wrapper + ' .bar').each(function() {
      var bar = $(this),
          value = bar.data('value'),
          percent = max_value > 0 ? Math.ceil((value / max_value) * 100) : 0;
      bar.width(percent + '%');
      bar.addClass('in');
    });
  }

  $(window).on('load', function() {
    $(".bar")
      .css('width', '0%')
      .attr('data-value', 0);

    fetch('/api/credits-par-jour')
      .then(response => response.json())
      .then(data => {
        

        data.forEach(item => {
          let jour = item.jour.toLowerCase();
          let valeur = item.total_credits;

          const mapJours = {
            monday: "Lundi",
            tuesday: "Mardi",
            wednesday: "Mercredi",
            thursday: "Jeudi",
            friday: "Vendredi",
            saturday: "Samedi",
            sunday: "Dimanche"
          };

          let jourFr = mapJours[jour];
          $(`.row:has(.label:contains(${jourFr})) .bar`)
            .attr('data-value', valeur);
        });
        generateBarGraph("#dashboard-stats");
      })
      .catch(error => console.error("Erreur API :", error));
  });
})(jQuery);



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




 async function chargerGraphiqueTrajets() {
  try {
    const res = await fetch("/api/statistiques/trajets-semaine");
    const data = await res.json();

    const options = {
      chart: {
        height: 300,
        width: 950,
        type: "area",
      },
      dataLabels: {
        enabled: false,
      },
      series: [{
        name: "Covoiturages",
        data: data 
      }],
      fill: {
        type: "gradient",
        gradient: {
          shadeIntensity: 1,
          opacityFrom: 0.7,
          opacityTo: 0.9,
          stops: [0, 90, 100],
        },
      },
      xaxis: {
        categories: [
          "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"
        ],
      },
    };

    const chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();

  } catch (e) {
    console.error("Erreur API : ", e);
  }
}
document.addEventListener("DOMContentLoaded", chargerGraphiqueTrajets);



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


