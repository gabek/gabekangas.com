document.addEventListener('DOMContentLoaded', function () {
  populateConcerts()
}, false)

function populateConcerts() {
  const url = "https://homepageproxy.gabekangas.com/concerts/concerts.go"

  fetch(url)
    .then(function (response) {
      return response.json();
    })
    .then(function (response) {
      if (response.concerts.length === 0) {
        document.getElementById("concerts-container").style.display = 'none'
        return
      }
      const newDOMItems = response.concerts.map(function (item) {
        return makeConcertDOMItem(item)
      })

      newDOMItems.forEach(element => {
        document.getElementById("concerts-content").appendChild(element)
      });
    })
    .catch(error =>
      document.getElementById("concerts-container").style.display = 'none'
    )
}

function makeConcertDOMItem(item) {
  let node = document.createElement("li")
  node.innerHTML = `<a href="${item.url}">${item.name}</a>`
  return node
}