// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

//jQuery(document).ready(function($) {

// site preloader -- also uncomment the div in the header and the css style for #preloader
//$(window).on('page:load',function(){
//	$('#preloader').fadeOut('fast',function(){$(this).remove();});
//});

//});

$(document).on('page:fetch', function() {
  $("#preloader").show();
});
$(document).on('page:change', function() {
  $("#preloader").hide();
});
