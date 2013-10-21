$(document).ready(function() {

  $('.material-button, .light-button, .medium-button, .heavy-button').click(function() { 

    item_data = {} // We're not sending any data on this request, only receiving data. 

    $.ajax({
      type: 'POST',
      url: 'item-cranks',
      data: item_data,
      beforeSend: function(data, xhr, settings) {
        $('.material-button').prop('disabled', true);
      },
      success: function(data, status, xhr) {
        console.log(data);
        $('.item_dump').text(data.name);
      },
      error: function(xhr, status, error) {
      },
      complete: function() {
        $('.material-button').prop('disabled', false);
      }
    });

  });
});