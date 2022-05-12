const modalBackground = document.querySelector('.modal-background');
const modalWindow = document.querySelector('.modal-window');
const openModal = document.querySelectorAll('.sign-up-button');
const closeModal = document.querySelectorAll('.close-button');
const signUpForm = document.getElementById("sign-up-form-id");
const userPolicy = document.getElementById("user-policy-checkbox");
const modalContent = document.getElementById("modal-content");
const messageFormat = "<span class='ajax-error'>%message%</span>";
const errorMessage =  messageFormat.replace("%message%", "Упс.. Произошла ошибка!")

function closeModalWindow() {
    modalBackground.classList.remove('active');
    modalWindow.classList.remove('active-window');
}

function openModalWindow() {
    modalBackground.classList.add('active');
    modalWindow.classList.add('active-window');
}

/**
 * Check button events for hide modal
 */
closeModal.forEach((button) => button.addEventListener('click', (e) => closeModalWindow()));

/**
 * Check button events for show modal
 */
openModal.forEach((button) => button.addEventListener('click', (e) => openModalWindow()));

/**
 * Check key events on page for hide modal
 */
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeModalWindow();
});


/**
 * Handle submit button
 */
signUpForm.onsubmit = async (e) => {
    e.preventDefault();

    let isAllowed = true;

    for (let child of signUpForm.children) { //Check all fields
        try {
            let value = child.value.toString();
            let isCorrectFlag = (value.length > 0);
            if (child.name === "username" && isCorrectFlag) {
                isCorrectFlag = !(/[^a-zA-zа-яА-Я]/.test(value));
            }
            if (child.name === "email" && isCorrectFlag) {
                isCorrectFlag = /\S+@\S+\.\S+/.test(value);
            }
            if (isCorrectFlag) child.classList.remove("invalid-field");
            else {
                child.classList.add("invalid-field");
                isAllowed = false;
            }
        } catch (errorText) {}
    }

    if (!userPolicy.checked) return; //Check if policy not accepted

    if (!isAllowed) return;
    let ajax = fetch('./fileHandler.php', { //Generate fetch request
        method: 'POST',
        body: new FormData(signUpForm)
    });

    ajax.then(result => result.json().then(jsonResult => { //Make async request
        if (jsonResult.status !== 200) modalContent.innerHTML = messageFormat.replace("%message%", jsonResult.message);
        else closeModalWindow();
    }).catch(() => modalContent.innerHTML = errorMessage)).catch(() => modalContent.innerHTML = errorMessage); //Catch exceptions
};
