$(document).ready(function() {

  $('li').mouseenter( function() {

    var top = $(this).offset().top + $(this).height() + 15;
    var left = $(this).offset().left; 
    $('#marker').stop(false, true).fadeIn(0);

    $('.active').removeClass('active');
    $(this).addClass('active');
    $('#marker').stop().animate( { top: top, left: left  }, 250, function() {
      //TODO Add color change here
    });
  });

  $('li:first').trigger('mouseover');
  $('#marker').hide();

  $('li').mouseleave(function() {
    
    $('.active').removeClass('active');
    $('#marker').fadeOut(150);
  });


});