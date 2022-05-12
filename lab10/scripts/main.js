const modalBackground = document.querySelector('.modal-background');
const modalWindow = document.querySelector('.modal-window');
const openModal = document.querySelectorAll('.sign-up-button');
const closeModal = document.querySelectorAll('.close-button');

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
openModal.forEach((button) => button.addEventListener('click', (e) => {
    e.preventDefault();
    openModalWindow();
}));

/**
 * Check key events on page for hide modal
 */
document.addEventListener('keydown', (e) => { if (e.key === 'Escape') closeModalWindow(); });