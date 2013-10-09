$(document).ready(function() {

  $('.material-button, .light-button, .medium-button, .heavy-button').click(function() { 

    var level = $('.playerlevel').text();
    var current_exp = $('.current-experience').text();
    var exp = $(this).attr("value");

    data = {  level : level, 
              current_experience : current_exp,
              experience_to_add : exp
           }

    $.ajax({
      type: 'POST',
      url: '/update-stats',
      data: data,
      beforeSend: function(data, xhr, settings) {
        $('.material-button').prop('disabled', true);
      },
      success: function(data, status, xhr) {
        console.log(data);
        $('.playerlevel').text(data.level);
        $('.current-experience').text(data.current_exp);
        $('.next-level-exp').text(data.exp_to_level);

        $('.level-from-db').text(data.percent_to_level);
        $('.progress-bar, .progress-bar-warning').width(data.percent_to_level + "%");
        $('.progress, .progress-bar').prop('title', data.percent_to_level + "% to next level")
      },
      error: function(xhr, status, error) {

      },
      complete: function() {
        $('.material-button').prop('disabled', false);
      }
    });
  }); 

});