// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require underscore
//= require gmaps/google
//= require slick.min
//= require placeholdem.min
//= require waypoints.min

//= require 'greensock/TweenLite'
//= require 'greensock/easing/EasePack'
//= require 'greensock/jquery.gsap.js'
//= require jquery.themepunch.revolution.min
//= require jquery.themepunch.plugins.min
//= require  bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready (function(){
  appMaster.preLoader();
  $(".alert-dismissible").fadeTo(2000, 500).slideUp(500, function(){
    (".alert-dismissible").alert('close');
  });
  $(".flashes").fadeTo(2000, 500).slideUp(500, function(){
    (".flashes").alert('close');
  });
});
