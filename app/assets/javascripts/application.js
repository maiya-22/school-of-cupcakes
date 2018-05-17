// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
// require turbolinks
//= require jquery
//= require jquery_ujs
//= require bubbly_button
//= require ajax_helpers
//= require main.js
// require_tree .
if (body) {
  simulateClick(body);
}

// toggle active status on buttons
const controllButtonsWrap = document.getElementById('controlButtonsWrap');
if (controllButtonsWrap) {
  const allControlButtons = document.getElementsByClassName('bubbly-button');
  controllButtonsWrap.addEventListener('click', (e) => {
    const { target } = e;
    if (target.tagName === 'A') {
      for (let i = 0; i < allControlButtons.length; i++) {
        const button = allControlButtons[i];
        if (button === target.parentNode) {
          setTimeout(() => {
            button.classList.add('active');
          }, 500);
        } else {
          button.classList.remove('active');
        }
      }
    }

    // if (target.tagName === 'BUTTON') {
    //   console.log(allControlButtons);
    //   for (let i = 0; i < allControlButtons.length; i++) {
    //     const button = allControlButtons[i];
    //     if(button != target) {
    //       button.classList.remove('active')
    //     } else {
    //       button.classList.add('active')
    //   }
    // }
  });
}
