$(document).ready(function() {

  $('.levelup, .light-button, .medium-button, .heavy-button').click(function() { 

    var level = $('.playerlevel').text();
    var current_exp = $('.current-experience').text();

    data = {  level : level, 
              current_experience : current_exp, 
           }

    $.ajax({
      type: 'POST',
      url: '/update-stats',
      data: data,
      beforeSend: function(data, xhr, settings) {
        $('levelup').prop('disabled', true);
        console.log("Before============================================");
        console.log(data);
        console.log(xhr);
      },
      success: function(data, status, xhr) {
        console.log("Success============================================");
        console.log(data);
        console.log("Worked" + data.message);
        $('.playerlevel').text(data.level);
        $('.level-from-db').append(data.message);
        $('.current-experience').text(data.current_exp);
        $('.next-level-exp').text(data.exp_to_level);
      },
      error: function(xhr, status, error) {
        console.log(xhr);
        console.log("Error= " + error);
      },
      complete: function() {
        $('.levelup').prop('disabled', false);
      }
    });
  }); 

});