$(document).ready(function () {

  var homeForm = $("#home-form");
  var depForm = $("#dependent-form");
  var conForm = $("#contact-form");
  $(".success-message").hide();

  homeForm.submit( function(e) {
    e.preventDefault();
    details = homeForm.serialize();
    $.post('/assessment/update_home', details, function(data) {
      $(".success-message").show();
    })
  });

  homeForm.change(function (){
    $(".success-message").hide();
  });

  depForm.submit( function(e) {
    e.preventDefault();
  });

  conForm.submit( function(e) {
    e.preventDefault();
  });
});
