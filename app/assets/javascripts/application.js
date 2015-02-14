$(document).ready(function() {
  $("#carrousel_controls").on('click', 'span', function() {
    $("#carrousel img").removeClass("opaque");

    var newImage = $(this).index();

    $("#carrousel img").eq(newImage).addClass("opaque");

    $("#carrousel_controls span").removeClass("selected");
    $(this).addClass("selected");
  });
});