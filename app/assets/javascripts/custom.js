
/* Projects carousel */

$('.carousel').carousel();

/* Slider 1 - Parallax slider*/

$(function() {
	$('#da-slider').cslider({
		autoplay	: true,
		interval : 9000
	});

});

$(document).ready(function () {
    $("a[rel^='prettyPhoto']").prettyPhoto({
        theme: 'facebook',
        slideshow: 5000,
        autoplay_slideshow: false,
        overlay_gallery: false,
        social_tools: false
    });
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
//    $( "#devotional-datepicker" ).datepicker({
//        dateFormat: 'yy-mm-dd'
//    });
    $( "#posted_at" ).datepicker({
        dateFormat: 'yy-mm-dd'
    });
});

$(function() {
    $('#month-datepicker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yy-mm',
        onClose: function(dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        },
        beforeShow : function(input, inst) {
            if ((datestr = $(this).val()).length > 0) {
                year = datestr.substring(datestr.length-4, datestr.length);
                month = jQuery.inArray(datestr.substring(0, datestr.length-5), $(this).datepicker('option', 'monthNames'));
                $(this).datepicker('option', 'defaultDate', new Date(year, month, 1));
                $(this).datepicker('setDate', new Date(year, month, 1));
            }
        }
    });
});

$(document).ready(function(){

    $('#content').each(function(i, elem) {
        $(elem).wysihtml5({
            "image": false
        });
    });

    $("#gallery-list").mixItUp({
        animation: {
            easing: 'ease-in-out',
            effects: 'fade scale'
        },
        load: {
            filter: '.none'
        },
        callbacks: {
            onMixLoad: function() {
                $("img.lazy").lazyload({
                    effect: "fadeIn"
                });
            },onMixEnd: function(){
                $("img.lazy").lazyload({
                });
            }

        }
    })

})



function checkTick() {
    if($('input[name="images[]"]').is(":checked"))
    {
        $('input[value="Delete selected"]').removeAttr('disabled');
    }

    else
    {
        $('input[value="Delete selected"]').attr('disabled', 'disabled');
    }
}

function GetURLHashParameter(sParam) {
    var sPageURL = document.location.toString();
    var sHashGroup = sPageURL.split('#')[1];
    var sURLVariables = sHashGroup.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}

$(document).ready(function() {

    var url = document.location.toString();
    if (url.match('#')) {
        $('.nav-tabs a[href=#'+GetURLHashParameter('month')+']').tab('show');

        setTimeout(function (){
            if ($('.nav-tabs a[href=#'+GetURLHashParameter('month')+']').parent().hasClass('active') ) {
                $("html, body").animate({ scrollTop: $('#'+GetURLHashParameter('slug')).offset().top }, 500);
            }
        }, 500);

    }

    // Change hash for page-reload
    $('.nav-tabs a').on('shown', function (e) {
        window.location.hash = e.target.hash;
    })
})