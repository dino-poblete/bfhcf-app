
/* Projects carousel */

$('.carousel').carousel();

/* Slider 1 - Parallax slider*/

$(function() {
	$('#da-slider').cslider({
		autoplay	: true,
		interval : 9000
	});

});
/* prettyPhoto Gallery */

jQuery(".prettyphoto").prettyPhoto({
   overlay_gallery: false, social_tools: false
});

/* Isotope */

// cache container
var $container = $('#portfolio');
// initialize isotope
$container.isotope({
  // options...
});

// filter items when filter link is clicked
$('#filters a').click(function(){
  var selector = $(this).attr('data-filter');
  $container.isotope({ filter: selector });
  return false;
});               

/* Flex slider */

  $(window).load(function() {
    $('.flexslider').flexslider({
      easing: "easeInOutSine",
      directionNav: false,
      animationSpeed: 1500,
      slideshowSpeed: 5000
    });
  });

/* Image block effects */

$(function() {
      $('ul.hover-block li').hover(function(){
        $(this).find('.hover-content').animate({top:'-3px'},{queue:false,duration:500});
      }, function(){
        $(this).find('.hover-content').animate({top:'125px'},{queue:false,duration:500});
      });
});

/* Slide up & Down */

$(".dis-nav a").click(function(e){
	e.preventDefault();
	var myClass=$(this).attr("id");
	$(".dis-content ."+myClass).toggle('slow');
});


/* Image slideshow */

$('#s1').cycle({
    fx:    'fade',
    speed:  2000,
    timeout: 300,
    pause: 1
 });

/* Support */

$("#slist a").click(function(e){
   e.preventDefault();
   $(this).next('p').toggle(200);
});

$('.entry .home-post-content').readmore({

    maxHeight: 240,
    speed: 500,
    moreLink: '<div class="button"><a href="#">Read More...</a></div>',
    lessLink: '<div class="button"><a href="#">Close</a></div>',
    afterToggle: function(trigger, element, more) {
        if(! more) { // The "Close" link was clicked
            $('html, body').animate( { scrollTop: element.offset().top }, {duration: 100 } );
        }
    },

    beforeToggle: function(trigger, element, more) {
        if(! more) { // The "Close" link was clicked
            $('html, body').animate( { scrollTop: element.offset().top }, {duration: 100 } );
        }
    }

});

$(function() {
    $( "#devotional-datepicker" ).datepicker();
});