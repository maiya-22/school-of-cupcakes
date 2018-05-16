console.log('ajax_helpers_test_variablein main.js file', ajax_helpers_test_variable);
// console.log('main.js loadeds');
// GLOBAL DOM ELEMENTS:
const body = document.getElementsByTagName('body')[0];

// If signed-out, signIn picture bounces when click the page:
const signInPicture = document.getElementById('signInPicture');
if (signInPicture) {
  body.addEventListener('click', () => {
    signInPicture.classList.add('bounceAnimation');
    setTimeout(() => {
      signInPicture.classList.remove('bounceAnimation');
    }, 1000);
  });
}

function requestPromise(uri, method = 'GET') {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open(method, uri);
    xhr.setRequestHeader('Content-Type', 'json');
    xhr.send();
    xhr.onload = function () {
      // resolve(JSON.stringify(xhr.responseText));
      resolve(xhr.responseText);
    };
    xhr.onerror = function () {
      reject(xhr.statusText);
    };
  });
}

// Display password hint:
const passwordHintButton = document.getElementById('forgotPassword');
if (passwordHintButton) {
  passwordHintButton.addEventListener('click', () => {
    const userName = document.getElementById('userName').value;
    requestPromise(`/password-hint/${userName}`)
      .then((hint) => {
        console.log(hint);
        console.log('made request');
        const hintText = document.getElementById('hintText');
        if (hintText) {
          hintText.remove();
        }
        const hintWrap = document.createElement('div');
        hintWrap.id = 'hintWrap';
        hintWrap.innerHTML = `<div id="hintText">password hint: </br> ${hint}</div>`;
        hintWrap.classList.add('transparent');
        hintWrap.classList.add('fadeIn');
        signInPicture.appendChild(hintWrap);
        setTimeout(() => {
          hintWrap.classList.add('opaque');
        }, 500);
        setTimeout(() => {
          hintWrap.classList.add('popAnimation');
        }, 500);
      })
      .catch((err) => {
        console.log(err);
      });
  });
}

// TO DO: ajax remove student from class
const removeStudentFromCohortContainer = document.getElementById('removeStudentsFromCohort');
if (removeStudentFromCohortContainer) {
  removeStudentFromCohortContainer.addEventListener('click', (e) => {
    const { target } = e;
    if (target.classList.contains('ajaxDelete')) {
      const id = target.id.split('-');
      const cohortId = id[1];
      const studentId = id[3];
      console.log(cohortId, studentId);
      // "/cohorts/8/cohorts/8/students/9"
      // to do: need to figure out why this route is doubling the first part:
      requestPromise(`cohorts/${cohortId}/students/${studentId}`, 'PATCH')
        .then((response) => {
          console.log(response);
        })
        .catch((err) => {
          console.log(err);
        });
      // remove the student from the cohort,
      // reload current page.
    }
  });
}
