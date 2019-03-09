document.addEventListener('DOMContentLoaded', function () {
  populateTopArtists()
}, false)

function populateTopArtists() {
  const url = "https://homepageproxy.gabekangas.com/artists/artists.go"

  fetch(url)
    .then(function (response) {
      return response.json();
    })
    .then(function (artists) {
      if (artists.length === 0) {
        document.getElementById("topartists-container").style.display = 'none'
        return
      }
      const newDOMItems = artists.map(function (item) {
        return makeTopArtistDOMItem(item)
      })

      newDOMItems.forEach(element => {
        document.getElementById("topartists-content").appendChild(element)
      });
    })
    .catch(error =>
      document.getElementById("topartists-container").style.display = 'none'
    )
}

function makeTopArtistDOMItem(item) {
  let date = new Date(item.created_at)

  let node = document.createElement("span")
  node.className = `tag_font_size_${item.count} topartist`
  node.innerHTML = `<a href="${item.url}">${item.name}</a>&nbsp;`
  return node
}