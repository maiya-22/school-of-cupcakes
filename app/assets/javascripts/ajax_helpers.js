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

const display = document.getElementById('displayFrame');
const controlButtonsWrap = document.getElementById('controlButtonsWrap');
let numberOfDisplays = 0;
// if (numberOfDisplays > 4) numberOfDisplays = 0;
if (controlButtonsWrap) {
  controlButtonsWrap.addEventListener('click', (e) => {
    const button = e.target;
    const dataType = button.innerHTML;
    const buttonIsActive = button.classList.contains('activeBubbly');
    if (buttonIsActive) {
      button.classList.remove('activeBubbly');
      const topicToRemoveFromDisplay = document.getElementById(dataType);
      if (topicToRemoveFromDisplay) topicToRemoveFromDisplay.remove();
      numberOfDisplays -= 1;
      if (numberOfDisplays === 0) {
        requestPromise('/pages/index_string')
          .then((htmlString) => {
            display.innerHTML = htmlString || 'hello';
          })
          .catch((e) => {
            console.log(e);
          });
      }
    } else if (!buttonIsActive) {
      button.classList.add('activeBubbly');
      if (numberOfDisplays === 0) display.innerHTML = '';
      numberOfDisplays += 1;
      requestPromise(`/${dataType}/all`)
        .then((objects) => {
          const parsedObjects = JSON.parse(objects);
          const topicFrame = document.createElement('div');
          topicFrame.classList.add('topicFrame');
          topicFrame.id = dataType;
          parsedObjects.forEach((object) => {
            createSummaryDomElement(object, dataType, topicFrame);
          });
          display.appendChild(topicFrame);
        })
        .catch((e) => {
          console.log(e);
        });
    }
  });
}
function createSummaryDomElement(object, type, displayElement) {
  // get the 'type' from their 'type' on the access table:
  // PROFILE WRAP:
  if (type === 'students' || type === 'teachers') {
    const profileWrap = document.createElement('div');
    profileWrap.classList.add('profileSummaryWrap');
    // PROFILE PIC:
    const profileSummaryPicWrap = document.createElement('div');
    profileSummaryPicWrap.classList.add('profileSummaryPicWrap');
    profileSummaryPicWrap.style.backgroundImage = `url('${object.pic}')`;
    profileWrap.appendChild(profileSummaryPicWrap);
    const showButton = document.createElement('a');
    showButton.innerHTML = `${object.first_name} ${object.last_name} : ${type}`;
    showButton.href = `/${type}/${object.id}`;
    profileWrap.appendChild(showButton);
    // ADD THE PROFILE TO THE DISPLAY:
    displayElement.appendChild(profileWrap);
    console.log(displayElement);
  }
}
