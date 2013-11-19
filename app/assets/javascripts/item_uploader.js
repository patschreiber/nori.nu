$(document).ready(function() {

  $('.material-button, .light-button, .medium-button, .heavy-button').click(function() {
    item_data = {} // We're not sending any data on this request, only receiving data. 

    $.ajax({
      type: 'PUT',
      url: 'item-cranks',
      data: item_data,
      beforeSend: function(data, xhr, settings) {
        $('.material-button').prop('disabled', true);
      },
      success: function(data, status, xhr) {
        console.log(data);
        $('.item-id').text(data.id);
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
      },
      complete: function() {
        $('.material-button').prop('disabled', false);
      }
    });

  });

  $('.save').click(function() {
    var item_id = $('.item-id').text();

    new_inventory_item = {
      id : item_id
    }

    $.ajax({ 
      type: 'PUT',
      url: '/inventory-add',
      data: new_inventory_item,
      success: function(data, status, xhr) {
        console.log(data);
        //TODO Place inventory items actually in the inventory
      }, 
      error: function(xhr, status, error) {

      },
      complete: function() {

      }
    });

  });

});