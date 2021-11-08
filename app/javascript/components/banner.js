import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Aprendendo brincando!", "Descomplicando a matemática financeira!"],
    typeSpeed: 50,
    cursorChar: '>',
    loop: true
  });
}

export { loadDynamicBannerText };