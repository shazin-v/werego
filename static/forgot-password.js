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
	fetch("{{ url_for('forgot_password') }}", {
		method: "POST",
		headers: {
			"Content-type": "application/x-www-form-urlencoded"
		},
		body: `email=${encodeURIComponent(email)}`
	})
		.then(response => {
			if (response.ok) {
				result.innerHTML = "An email has been sent to your email address with instructions on how to reset your password.";
				result.style.display = "block";
			} else {
				error.innerHTML = "Sorry, we couldn't find an account associated with that email address.";
				error.style.display = "block";
			}
		})
		.catch(error => {
			console.error("Error sending request:", error);
			error.innerHTML = "Sorry, an error occurred while sending the request.";
			error.style.display = "block";
		});
});
