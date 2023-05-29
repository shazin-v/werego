const loginForm = document.querySelector('#login');
const createAccountForm = document.querySelector('#createAccount');
const loginLink = document.querySelector('#loginLink');
const createAccountLink = document.querySelector('#createAccountLink');

loginLink.addEventListener('click', e => {
    e.preventDefault();
    loginForm.classList.remove('form--hidden');
    createAccountForm.classList.add('form--hidden');
});

createAccountLink.addEventListener('click', e => {
    e.preventDefault();
    loginForm.classList.add('form--hidden');
    createAccountForm.classList.remove('form--hidden');
});

loginForm.addEventListener('submit', e => {
    const username = document.querySelector('#username').value;
    const password = document.querySelector('#password').value;
    const errorContainer = document.querySelector('#login .form__message--error');
    const errorMessages = document.querySelectorAll('#login .form__input-error-message');
    let isError = false;

    // Clear previous error messages
    errorContainer.innerHTML = '';
    errorMessages.forEach(message => message.textContent = '');

    // Perform form validation
    if (username.trim() === '') {
        displayErrorMessage('username', 'Please enter a username');
        isError = true;
    }

    if (password.trim() === '') {
        displayErrorMessage('password', 'Please enter a password');
        isError = true;
    }

    if (isError) {
        e.preventDefault();
        errorContainer.textContent = 'Please enter the required details.';
    }
});

createAccountForm.addEventListener('submit', e => {
    const username = document.querySelector('#signupUsername').value;
    const email = document.querySelector('#createAccount input[name="email"]').value;
    const password = document.querySelector('#createAccount input[name="password"]').value;
    const confirmPassword = document.querySelector('#createAccount input[name="confirmPassword"]').value;
    const errorContainer = document.querySelector('#createAccount .form__message--error');
    const errorMessages = document.querySelectorAll('#createAccount .form__input-error-message');
    let isError = false;

    // Clear previous error messages
    errorContainer.innerHTML = '';
    errorMessages.forEach(message => message.textContent = '');

    // Perform form validation
    if (username.trim() === '') {
        displayErrorMessage('signupUsername', 'Please enter a username');
        isError = true;
    }

    if (email.trim() === '') {
        displayErrorMessage('email', 'Please enter an email address');
        isError = true;
    }

    if (password.trim() === '') {
        displayErrorMessage('password', 'Please enter a password');
        isError = true;
    }

    if (confirmPassword.trim() === '') {
        displayErrorMessage('confirmPassword', 'Please confirm the password');
        isError = true;
    } else if (password !== confirmPassword) {
        displayErrorMessage('confirmPassword', 'Passwords do not match');
        isError = true;
    }

    if (isError) {
        e.preventDefault();
        errorContainer.textContent = 'Please enter the required details.';
    }
});

function displayErrorMessage(inputName, message) {
    const errorContainer = document.querySelector(`#${inputName} + .form__input-error-message`);
    errorContainer.textContent = message;
}
