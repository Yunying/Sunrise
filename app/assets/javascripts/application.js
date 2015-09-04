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
//= require jquery_ujs
//= require jquery-ui
//= require jquery.purr
//= require best_in_place
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker

jQuery(function($) {
	$("tr[data-link]").click(function() {
		window.location = this.dataset.link
	});
})

$(document).ready(function(){
	$(".hidden-panel").hide();
    $(".show_client").click(function(){
        $(".hidden-panel").slideToggle();
    });
});

$(document).ready(function(){
    $(".show-invoice").click(function(){
        $(".hidden-invoice-panel").slideToggle();
    });
});

$(document).ready(function(){
    $(".order-heading").click(function(){
        $(".order-panel").slideToggle();
    });
});

$(document).ready(function(){
    $(".mouseover-show").mouseover(function(){
        $(".mouseover-dropdown").slideToggle();
    });
    $(".mouseover-show").mouseout(function(){
        $(".mouseover-dropdown").slideToggle();
    });

    $(".mouseover-show2").mouseover(function(){
        $(".mouseover-dropdown2").slideToggle();
    });
    $(".mouseover-show2").mouseout(function(){
        $(".mouseover-dropdown2").slideToggle();
    });
});
