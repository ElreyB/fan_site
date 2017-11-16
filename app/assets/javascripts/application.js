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

function hideAll(){
  $(".alpha_list, .oldest_list, .newest_list").addClass("hide");
}

$(document).ready(function(){
  $(document).on("click", ".alphabetically", function(e){
    hideAll();
    $(".alpha_list").removeClass("hide");
    e.preventDefault();
  });

  $(document).on("click", ".oldest_first", function(e){
    hideAll();
    $(".oldest_list").removeClass("hide");
    e.preventDefault();
  });

  $(document).on("click", ".newest_first", function(e){
    hideAll();
    $(".newest_list").removeClass("hide");
    e.preventDefault();
  });

  $('.dropdown-toggle').dropdown()

  $(document).on("click", "#admin", function(e){
    hideAll();
    $("span.admin").toggleClass("hide");
    e.preventDefault();
  });
});
