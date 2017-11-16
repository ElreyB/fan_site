// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
// = require_tree .
// = require jquery3
// = require jquery_ujs
// = require bootstrap-sprockets

$(document).ready(function(){
  $(document).on("click", ".alphabetically", function(e){
    $(".alpha_list").toggleClass("hide");
    e.preventDefault();
  });

  $(document).on("click", ".oldest_first", function(e){
    $(".oldest_list").toggleClass("hide");
    e.preventDefault();
  });

  $(document).on("click", ".newest_first", function(e){
    $(".newest_list").toggleClass("hide");
    e.preventDefault();
  });

});
