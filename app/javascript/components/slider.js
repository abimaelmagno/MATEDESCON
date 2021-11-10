

const initslider =() => {

 if (document.getElementById("myRange_0")) { 
  // Forma 1
// const slider = document.getElementById("myRange");
// const output = document.getElementById("demo");
// output.innerHTML = slider.value; // Display the default slider value

// console.log(slider.oninput);
// console.log(output);

// slider.oninput = function() {
//   output.innerHTML = this.value;
// };

//  Forma 2
// let i = document.querySelector('input'),
//     o = document.querySelector('output');

// o.innerHTML = i.value;

// use 'change' instead to see the difference in response
// i.addEventListener('input', function () {
//   o.innerHTML = i.value;
// }, false);

// Forma 3

document.getElementById('myRange_0').addEventListener("input", report);
document.getElementById('myRange_1').addEventListener("input", report);
document.getElementById('myRange_2').addEventListener("input", report);

function report(event){
  this.nextElementSibling.querySelector("output").textContent = this.value;
  };
 }
};


// Update the current slider value (each time you drag the slider handle)

// slider.addEventListener('input', function () {
//   o.innerHTML = slider.value;
// }, false);
export{initslider};
