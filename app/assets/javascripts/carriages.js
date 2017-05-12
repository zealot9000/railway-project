$(document).ready(function() {
  $('#carriage_type').change(function() {

    var type; 
    type = $('#carriage_type').val().toLowerCase();

    switch(type){
      case "coupecarriage":
      $('#sitting, #side_top, №side_bottom').addClass("hidden");
      $('#top, #bottom').removeClass("hidden");
      break;

      case "comfortablecarriage":
      $('#sitting, #side_top, #side_bottom, #top').addClass("hidden");
      $('#bottom').removeClass("hidden");
      break;

      case "sittingcarriage":
      $('#side_top, #side_bottom, #top, #bottom').addClass("hidden");
      $('#sitting').removeClass("hidden");
      break;

      case "economycarriage":
      $('#sitting').addClass("hidden");
      $('#side_top, #side_bottom, #top, #bottom').removeClass("hidden");
      break;
    };  
  });
}); 
