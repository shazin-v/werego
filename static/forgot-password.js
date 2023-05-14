const form = document.getElementById("forgot-password-form");
const result = document.getElementById("result");
const error = document.getElementById("error");

form.addEventListener("submit", function(event) {
	event.preventDefault();

	// Hide the result and error messages
	result.style.display = "none";
	error.style.display = "none";

	const email = form.email.value;

	// Validate email format
	if (!validateEmail(email)) {
		error.innerHTML = "Please enter a valid email address.";
		error.style.display = "block";
		return;
	}

	// Send email to the server to reset the password
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200) {
				result.innerHTML = "An email has been sent to your email address with instructions on how to reset your password.";
				result.style.display = "block";
			} else {
				error.innerHTML = "Sorry, we couldn't find an account associated with that email address.";
				error.style.display = "block";
			}
		}
	}
	xhr.open("POST", "{{ url_for('forgot_password') }}");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(`email=${email}`);
});

// Function to validate email format
function validateEmail(email) {
	const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	return re.test(email);
}

