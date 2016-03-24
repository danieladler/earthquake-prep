$(document).ready(function () {

  $(".success-message").hide();
  var homeForm = $("#home-form");
  var depForm = $("#dependent-form");
  var conForm = $("#contact-form");
  var deleteRec = $(".delete-record");

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
    var li = (
      "<li class='dep-list-item'><span>Name: " + depForm.find('input[name="dep_name"]').val() + "</span><button class='delete-dep'> x </button></li>"
    )
    $.post('/assessment/add_dependent', details, function(data) {
      $("#dependent-list").append(li);
    })
  });

  conForm.submit( function(e) {
    e.preventDefault();
    details = conForm.serialize();
    var li = (
      "<li class='con-list-item'><span>Name: " + conForm.find('input[name="con_name"]').val() + "</span><button class='delete-con'> x </button></li>"
    )
    $.post('/assessment/add_contact', details, function(data) {
      $("#contact-list").append(li);
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
