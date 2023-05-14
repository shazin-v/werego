$(document).ready(function() {
    // Listen for when the user clicks the "Book Now" button
    $('table').on('click', 'button', function() {
      // Get the station name from the row
      var station_name = $(this).closest('tr').find('td:first').text();
  
      // Send a POST request to the server with the selected station name
      $.ajax({
        type: "POST",
        url: "/book-now",
        data: { station_name: station_name },
        success: function(response) {
          // Redirect to the booking page
          window.location.href = "/booking?station_name=" + station_name;
        }
      });
    });
  }); // <--- Add this closing curly brace
  