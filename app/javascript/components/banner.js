import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
    strings: ["Aprendendo brincando!", "Descomplicando a matemática financeira!"],
    typeSpeed: 70,
    cursorChar: '💰',
    loop: true
   });
  }
}

export { loadDynamicBannerText };