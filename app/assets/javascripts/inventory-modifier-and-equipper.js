$(document).ready(function() {
  $('.inventory-item').on('mouseenter', function() {
    $(this).popover({
      html: true,
      trigger: 'manual', 
      delay: {show: 300, hide: 0},
      title: 'sup',
      content: 'This button was specified in the initial HTML document'
    }).popover('show');
  })
  .on('mouseleave', function() {
    $(this).not('.active').popover('hide');
  })
  .on('click', function() {

    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
    }
    else {
      $(this).addClass('active');
    }
  });



  //Hover effect for items in the inventory
  //Equip Items
  //Unequip items
  //Delete items


});


/*
    $('.inventory-item').mouseenter(function() {
      $(this).popover({
        html: true,
        trigger: 'manual', 
        delay: {show: 300, hide: 0},
        title: 'sup',
        content: 'This button was specified in the initial HTML document',
      }).popover('show');
    })
    .mouseleave(function() {
      $(this).popover('hide');
    });


    */


// Ajax call http://stackoverflow.com/questions/14736604/twitter-bootstrap-popover-and-ajax