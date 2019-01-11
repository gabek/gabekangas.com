document.addEventListener('DOMContentLoaded', function () {
  populateMastodon()
}, false)

function populateMastodon() {
  const url = "https://mastodon.social/api/v1/accounts/271966/statuses?exclude_replies=false"

  fetch(url)
    .then(function (response) {
      return response.json();
    })
    .then(function (myJson) {
      const filtered = myJson.filter(function (item) {
        return (item.favourites_count > 0 || item.reblogs_count > 0 || item.replies_count > 0) && !item.in_reply_to_id && !item.sensitive && item.mentions == 0 && item.spoiler_text === ""
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
  let date = new Date(item.created_at)

  let icon = document.createElement("span")
  icon.innerHTML = '<i class="fas fa-comment-alt"></i>&nbsp;'
  let node = document.createElement("div")
  node.innerHTML = `${item.content}`

  const dateNode = document.createElement("span")
  dateNode.innerHTML = `<br>-${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`
  node.getElementsByTagName("p")[0].prepend(icon)
  node.getElementsByTagName("p")[node.getElementsByTagName("p").length - 1].appendChild(dateNode)
  return node
}