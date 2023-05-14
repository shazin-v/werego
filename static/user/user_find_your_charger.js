// Get the form element
const form = document.querySelector('form');

// Listen for form submission event
form.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent form submission

  // Get the selected values of the dropdowns
  const city = document.getElementById('city').value;
  const charger_type = document.getElementById('charger_type').value;

  // Send the data to the Flask route using AJAX
  const xhr = new XMLHttpRequest();
  xhr.open('POST', '/process', true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // Redirect to the results page
      window.location.href = '/station_search?city=' + city + '&charger_type=' + charger_type;
    }
  };
  xhr.send(JSON.stringify({ city: city, charger_type: charger_type }));
});