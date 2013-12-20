$(document).ready(function() {

  $('#material-button, #light-button, #medium-button, #heavy-button').click(function() { 
    var button_clicked = $(this).attr("id");

    data = {  
              item_button_clicked : button_clicked
           }

    $.ajax({
      type: 'PUT',
      url: '/update-stats',
      data: data, //Data to submit
      beforeSend: function(data, xhr, settings) {
      },
      success: function(data, status, xhr) {
        $('.playerlevel').text(data.level);
        $('.current-experience').text(data.current_exp);
        $('.next-level-exp').text(data.exp_to_level);

        $('.level-from-db').text(data.percent_to_level);
        $('.progress-bar, .progress-bar-warning').width(data.percent_to_level + "%");
        $('.progress, .progress-bar').prop('title', data.percent_to_level + "% to next level")
      },
      error: function(xhr, status, error) {
        alert("It looks like the experience value has been modified. You will not receive experience for this click.");
      },
      complete: function() {
      }
    });
  }); 

});