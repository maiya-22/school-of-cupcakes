const ajax_helpers_test_variable = true;

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

// const display = document.getElementById('displayFrame');
// const controlButtonsWrap = document.getElementById('controlButtonsWrap');
// let numberOfDisplays = 0;
// if (controlButtonsWrap) {
//   controlButtonsWrap.addEventListener('click', (e) => {
//     function removeColumns(element) {
//       element.classList.remove('oneColumn');
//       element.classList.remove('twoColumn');
//       element.classList.remove('threeColumn');
//       element.classList.remove('fourColumn');
//     }
//     const button = e.target;
//     // break out of the function, if the target is not a button:
//     if (button.tagName !== 'BUTTON') return null;
//     const dataType = button.innerHTML;
//     const buttonIsActive = button.classList.contains('activeBubbly');
//     if (buttonIsActive) {
//       button.classList.remove('activeBubbly');
//       const topicToRemoveFromDisplay = document.getElementById(dataType);
//       if (topicToRemoveFromDisplay) topicToRemoveFromDisplay.remove();
//       numberOfDisplays -= 1;
//       if (numberOfDisplays === 0) {
//         requestPromise('/pages/index_string')
//           .then((htmlString) => {
//             display.classList.remove('displayFrameDisplay');
//             display.classList.add('displayFrameHome');
//             display.innerHTML = htmlString || 'hello';
//           })
//           .catch((e) => {
//             console.log(e);
//           });
//       }
//     } else if (!buttonIsActive) {
//       button.classList.add('activeBubbly');
//       if (numberOfDisplays === 0) {
//         display.classList.remove('displayFrameHome');
//         display.classList.add('displayFrameDisplay');
//         display.innerHTML = '';
//         removeColumns(display);
//         display.classList.add('oneColumn');
//       }
//       numberOfDisplays += 1;
//       requestPromise(`/${dataType}/all`)
//         .then((data) => {
//           // the frame that will be added to the DOM:
//           const topicFrame = document.createElement('div');
//           topicFrame.classList.add('topicFrame');
//           topicFrame.id = dataType;
//           if (dataType === 'teachers' || dataType === 'students') {
//             const parsedObjects = JSON.parse(data);
//             console.log(data);
//             parsedObjects.forEach((object) => {
//               createSummaryDomElement(object, dataType, topicFrame);
//             });
//           } else {
//             topicFrame.innerHTML = data;
//           }
//           removeColumns(display);
//           if (numberOfDisplays === 2) {
//             display.classList.add('twoColumn');
//           } else if (numberOfDisplays === 3) {
//             display.classList.add('threeColumn');
//           } else if (numberOfDisplays === 4) {
//             display.classList.add('fourColumn');
//           }
//           display.appendChild(topicFrame);
//         })
//         .catch((e) => {
//           console.log(e);
//         });
//     }
//   });
// }
// // creates student and teacher profile summaries:
// function createSummaryDomElement(object, type, displayElement) {
//   // get the 'type' from their 'type' on the access table:
//   // PROFILE WRAP:
//   if (type === 'students' || type === 'teachers') {
//     const profileWrap = document.createElement('div');
//     profileWrap.classList.add('profileSummaryWrap');
//     // PROFILE PIC:
//     const profileSummaryPicWrap = document.createElement('div');
//     profileSummaryPicWrap.classList.add('profileSummaryPicWrap');
//     profileSummaryPicWrap.style.backgroundImage = `url('${object.pic}')`;
//     profileWrap.appendChild(profileSummaryPicWrap);
//     const showButton = document.createElement('a');
//     showButton.innerHTML = `${object.first_name} ${object.last_name} : ${type.slice(
//       0,
//       type.length - 1,
//     )}`;
//     showButton.href = `/${type}/${object.id}`;
//     profileWrap.appendChild(showButton);
//     // ADD THE PROFILE TO THE DISPLAY:
//     displayElement.appendChild(profileWrap);
//     console.log(displayElement);
//   }
// }
