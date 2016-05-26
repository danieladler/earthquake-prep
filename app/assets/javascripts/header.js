// $(document).ready(function () {
//
//   var headerWrap = $(".header-wrap");
//   var headerHeight = headerWrap.outerHeight();
//
//   $(document).scroll(function(e){
//     var scrollPercent = (headerHeight - window.scrollY) / headerHeight;
//     // console.log(scrollPercent);
//       if (scrollPercent < .70) {
//         headerWrap.css('background-color', 'rgba(145, 145, 145, 1)');
//       }
//       else  headerWrap.css('background-color', 'rgba(255, 255, 255, 0.0)');
//   });
// });

$(document).ready(function() {
  $("header [href]").each(function() {
    if (this.href == window.location.href) {
      $(this).addClass("currentPage");
    }
  });
});
