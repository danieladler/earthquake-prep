$(document).ready(function () {

  $(".success-message-home").hide();
  $(".success-message-gear").hide();
  var homeForm = $("#home-form");
  var depForm = $("#dependent-form");
  var conForm = $("#contact-form");
  var gearForm = $("#gear-form");
  var deleteRec = $(".delete-record");

  homeForm.submit( function(e) {
    e.preventDefault();
    details = homeForm.serialize();
    $.post('/assessment/update_home', details, function(data) {
      $(".success-message-home").show();
    })
  });

  homeForm.change(function (){
    $(".success-message").hide();
  });

  depForm.submit( function(e) {
    e.preventDefault();
    details = depForm.serialize();
    var li = (
      "<li class='asmt-list-item'><span>Name: " + depForm.find('input[name="dep_name"]').val() + "</span><button class='delete-record'> x </button></li>"
    )
    $.post('/assessment/add_dependent', details, function(data) {
      $("#dependent-list").append(li);
    })
  });

  conForm.submit( function(e) {
    e.preventDefault();
    details = conForm.serialize();
    var li = (
      "<li class='asmt-list-item'><span>Name: " + conForm.find('input[name="con_name"]').val() + "</span><button class='delete-record'> x </button></li>"
    )
    $.post('/assessment/add_contact', details, function(data) {
      $("#contact-list").append(li);
    })
  });

  gearForm.submit( function(e) {
    e.preventDefault();
    details = gearForm.serialize();
    $.post('/assessment/update_gear', details, function(data) {
      $(".success-message-gear").show();
    })
  });

  deleteRec.click( function() {
    var url = $(this).attr("href");
    var parent = $(this).parent();
    $.ajax({
      url: url,
      type: 'DELETE',
      function(data) {
      }
    });
    parent.remove();
  });
});
