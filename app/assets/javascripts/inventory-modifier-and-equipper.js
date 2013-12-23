$(document).ready(function() {

    $('.inventory-item').click(function() {
      var id = this.id;
      $(this).popover({
        html: true
      }).popover('show');

    });

  //Hover effect for items in the inventory
  //Equip Items
  //Unequip items
  //Delete items


});
