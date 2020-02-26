document.addEventListener('DOMContentLoaded', function () {
  populateMastodon()
}, false)

function populateMastodon() {
  const url = "https://mastodon.social/api/v1/accounts/271966/statuses?exclude_replies=true"

  fetch(url)
    .then(function (response) {
      return response.json();
    })
    .then(function (myJson) {
      const filtered = myJson.filter(function (item) {
        console.log(item.media_attachments)
        return !item.in_reply_to_id
          && !item.sensitive
          && item.mentions == 0
          && item.spoiler_text === ""
          && item.media_attachments.length == 0
          && !item.muted
          && !item.locked

      })

      if (filtered.length < 5) {
        document.getElementById("mastodon-container").style.display = 'none'
        return
      }
      const newDOMItems = filtered.map(function (item) {
        return makeMastodonDOMItem(item)
      }).slice(0, 4)

      newDOMItems.forEach(element => {
        document.getElementById("mastodon-content").appendChild(element)
      });
      document.getElementById("mastodon-content")
      console.log(filtered)
    })
    .catch(error =>
      document.getElementById("mastodon-container").style.display = 'none'
    )
}

function makeMastodonDOMItem(item) {
  let node = document.createElement("div")
  node.className = "sidebar-item"
  node.innerHTML = `${item.content}<hr>`
  return node
}