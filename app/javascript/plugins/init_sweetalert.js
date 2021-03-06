import swal from 'sweetalert';


const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options) // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };