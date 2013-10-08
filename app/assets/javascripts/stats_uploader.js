$(document).ready(function() {

  $('.levelup, .light-button, .medium-button, .heavy-button').click(function() { 

    var level = $('.playerlevel').text();
    var current_exp = $('.current_experience').text();
    var total_exp = $('.total_experience').text();

    data = {  level : level, 
              current_experience : current_exp, 
              total_experience : total_exp 
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
        $('.current_experience').text(data.current_exp);
        $('.total_experience').text(data.total_exp);
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