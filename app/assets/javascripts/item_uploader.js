$(document).ready(function() {

  $('.material-button, .light-button, .medium-button, .heavy-button').click(function() {
    item_data = {} // We're not sending any data on this request, only receiving data. 

    $.ajax({
      type: 'PUT',
      url: 'item-cranks',
      data: item_data,
      beforeSend: function(data, xhr, settings) {
        $('.material-button, .light-button, .medium-button, .heavy-button').attr('disabled', true);
      },
      success: function(data, status, xhr) {
        console.log(data);
        $('.item-id').text(data.id);
        $('.is-set').text(data.is_set);
        $('.set-id').text(data.set_id);
        $('.set-item-number').text(data.set_item_number);
        $('.is-unique').text(data.is_unique);
        $('.prefix').text(data.prefix);
        $('.suffix').text(data.suffix);
        $('.name').text(data.name);
        $('.attack-val').text(data.computed_attack);
        $('.defense-val').text(data.computed_defense);
        $('.luck-val').text(data.computed_luck);
        $('.stealth-val').text(data.computed_stealth);
        $('.min-equip-player-level-val').text(data.min_equip_player_level);
        $('.tier-val').text(data.tier);
        $('.monetary-val').text(data.value);
        $('.flavor-text').text(data.flavor_text);
      },
      error: function(xhr, status, error) {
        alert("It looks like grabbing the item is taking a long time. You might want to try again.");
      },
      complete: function() {
        $('.material-button, .light-button, .medium-button, .heavy-button').attr('disabled', false);
        $('.item-found').removeClass("hidden-element").find('.item-buttons').removeClass("hidden-element");
      }
    });

  });

  $('.save').click(function() {
    var save_item = 1

    save = {
      save_item : save_item
    }

    $.ajax({ 
      type: 'PUT',
      url: '/inventory-add',
      data: save,
      success: function(data, status, xhr) {
        console.log(data);
        //TODO Place inventory items actually in the inventory
      }, 
      error: function(xhr, status, error) {
        //TODO Test this
        if (typeof new_inventory_item.item_id != "undefined") {
          alert("There was an error and your item (ID: " + new_inventory_item.id + " ) was not saved!");
        }
      },
      complete: function() {
        $('.item-buttons').attr('disabled', true);
        //TODO Add alert for user that item was saved successfully
      }
    });
  });

  $('.trash').click(function() {
    if (confirm('This item will be destroyed. Is this ok?')) {
      alert("Destroyed item.");
      //TODO Actually remove item Information
    }
  });

});