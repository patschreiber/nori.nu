$(document).ready(function() {
  $('.inventory-item').on('mouseenter', function() {
    if(!$(this).hasClass('active')) {
      $(this).popover({
        html: true,
        trigger: 'manual', 
        delay: {show: 300, hide: 0},
        title: function() {
          return $(this).find('.item-name').text();
        },
        content: function() {
          return $(this).find('.popover-content').html();
        }
      }).popover('show');
    }
  })
  .on('mouseleave', function() {
    $(this).not('.active').popover('hide');
  })
  .on('click', function() {
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      $(this).find('.info').html("<span class=\"ss-icon margin-right-10\">&#x1F512;</span>Click the item to equip or delete.");
      $(this).find('.equip').hide();
      $(this).find('.delete').hide();
      $(this).popover('show');
    }
    else {
      $(this).addClass('active');
      $(this).find('.info').html("<span class=\"ss-icon margin-right-10\">&#x1F513;</span>Click the item to lock changes.");
      $(this).find('.equip').show();
      $(this).find('.delete').show();

      $(this).popover('show');
    }

    $('.delete-button').on('click', function() {
      if (confirm('This item will be destroyed. This cannot be undone. Is this ok?')) {
        console.log(this.parent);
      }
    });

    $('.equip-button').on('click', function() {
      // Find Parent and ID, then send that via AJAX with a 'true' so the item will be equipped.
    });
  });


});

// Ajax call http://stackoverflow.com/questions/14736604/twitter-bootstrap-popover-and-ajax

  //Hover effect for items in the inventory
  //Equip Items
  //Unequip items
  //Delete items