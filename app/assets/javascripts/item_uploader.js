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
    var item_id = $('.item-id').text();
    var is_set = $('.is-set').text();
    var set_id = $('.set-id').text();
    var set_item_number = $('.set-item-number').text();
    var is_unique = $('.is-unique').text();
    var prefix = $('.prefix').text();
    var suffix = $('.suffix').text();
    var name = $('.name').text();
    var tier = $('.tier-val').text();
    var monetary_val = $('.monetary-val').text();
    var min_equip_player_level = $('.min-equip-player-level-val').text();
    var attack_val = $('.attack-val').text();
    var defense_val = $('.defense-val').text();
    var luck_val = $('.luck-val').text();
    var stealth_val = $('.stealth-val').text();
    var flavor_text = $('.flavor-text').text();

    new_inventory_item = {
      id : item_id,
      is_set : is_set,
      set_id : set_id,
      set_item_number : set_item_number,
      is_unique : is_unique,
      prefix : prefix,
      suffix : suffix,
      name : name,
      tier : tier,
      min_equip_player_level : min_equip_player_level,
      attack_val : attack_val,
      defense_val : defense_val,
      luck_val : luck_val,
      stealth_val : stealth_val,
      value : monetary_val,
      flavor_text : flavor_text
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