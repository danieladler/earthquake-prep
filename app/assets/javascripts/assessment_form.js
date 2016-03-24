$(document).ready(function () {

  $(".success-message").hide();
  var homeForm = $("#home-form");
  var depForm = $("#dependent-form");
  var conForm = $("#contact-form");
  var deleteDep = $(".delete-dep");

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
      "<li class='dep-list-item'><span>Name: " + depForm.find('input[name="dep_name"]').val() + "</span><button class='delete-dep'> Delete </button></li>"
    )

    $.post('/assessment/add_dependent', details, function(data) {
      $("#dependent-list").append(li);
    })
  });

  deleteDep.click( function() {
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

  conForm.submit( function(e) {
    e.preventDefault();
  });
});
