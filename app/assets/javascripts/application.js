// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require froala_editor.min.js
//= require responsivecarrousel.min.js
//= require google_analytics.js.coffee

var ready;
ready = function() {

  $('#post_content').editable({inlineMode: false})
  // $("#carrousel_controls").on('click', 'span', function() {
  //   $("#carrousel img").removeClass("opaque");

  //   var newImage = $(this).index();

  //   $("#carrousel img").eq(newImage).addClass("opaque");

  //   $("#carrousel_controls span").removeClass("selected");
  //   $(this).addClass("selected");
  // });
  $('.boxgrid.captionfull').hover(function(){
        $(".cover", this).stop().animate({top:'350px',opacity:'1'},{queue:false,duration:500});
  }, function() {
        $(".cover", this).stop().animate({top:'420px',opacity:'0'},{queue:false,duration:500});
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
