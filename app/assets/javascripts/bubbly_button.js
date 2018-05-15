const animateButton = function (e) {
  e.preventDefault;
  // reset animation
  e.target.classList.remove('animate');

  e.target.classList.add('animate');
  setTimeout(() => {
    e.target.classList.remove('animate');
  }, 700);
};

const bubblyButtons = document.getElementsByClassName('bubbly-button');

// document.addEventListener("turbolinks:request-start", function(event) {

// });

for (let i = 0; i < bubblyButtons.length; i++) {
  bubblyButtons[i].addEventListener('click', animateButton, false);
  // customization: trigger bubbly animation on page load:
  setTimeout(() => {
    simulateClick(bubblyButtons[i]);
  }, 500);
}

// customization:
function simulateClick(element) {
  const event = new MouseEvent('click', {
    view: window,
    bubbles: true,
    cancelable: true,
  });
  const cb = element;
  const cancelled = !cb.dispatchEvent(event);
  if (cancelled) {
    // A handler called preventDefault.
    // alert('cancelled');
  } else {
    // None of the handlers called preventDefault.
    // alert('not cancelled');
  }
}
