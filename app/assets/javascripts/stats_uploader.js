$(document).ready(function() {

  $('.levelup').click(function() { 

    var level = $('.playerlevel').text();

    data = "level=" + level;

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