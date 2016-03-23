$(document).ready(function () {

  $(".success-message").hide();
  var homeForm = $("#home-form");
  var depForm = $("#dependent-form");
  var conForm = $("#contact-form");

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
    details = depForm.serialize();
    $.post('/assessment/add_dependent', details, function(data) {
      $("#dependent-list").append("Name: " + depForm.find('input[name="dep_name"]').val());
    })
  });

  conForm.submit( function(e) {
    e.preventDefault();
  });
});
