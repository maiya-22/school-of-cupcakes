function requestPromise(uri, method = 'GET') {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open(method, uri);
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

// const controlButtonsWrap = document.getElementById('controlButtonsWrap');
// if (controlButtonsWrap) {
//   controlButtonsWrap.addEventListener('click', (e) => {
//     const resource = `/${e.target.innerHTML}`;
//     console.log(resource);
//     requestPromise(resource)
//       .then((data) => {
//         console.log(data);
//       })
//       .catch((e) => {
//         console.log(e);
//       });
//   });
// }
