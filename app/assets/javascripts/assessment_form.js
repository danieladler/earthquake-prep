$(document).ready(function () {

  var homeForm = $("#home-form");
  var depForm = $("#dependent-form");
  var conForm = $("#contact-form");

  homeForm.submit( function(e) {
    e.preventDefault();
    details = homeForm.serialize();
    $.post('/assessment/update_home', details, function(data) {
      homeForm.html(data);
    });
  });

  depForm.submit( function(e) {
    e.preventDefault();
  });

  conForm.submit( function(e) {
    e.preventDefault();
  });

});
