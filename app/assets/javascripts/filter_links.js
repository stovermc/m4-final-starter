$( document ).ready(function(){
  $("#link-filter").on("keyup", filterLinks)
  $('#filter-read').on('click', filterRead)
})

function filterLinks() {
  const filter = this.value.toUpperCase()
  const links = document.getElementsByClassName('link')

  for(i = 0; i < links.length; i++) {

    const linkTitle = links[i].children[0].innerHTML
    const linkURL = links[i].children[1].innerHTML
    const match = linkTitle.toUpperCase().indexOf(filter) > -1 ||
                  linkURL.toUpperCase().indexOf(filter) > -1
    links[i].style.display = match ?  "" : "none"
  }
}

function filterRead() {
  $('.link').each( function(index, link) {
    let readStatus = $(link).find('.read-status').text()
    if(readStatus.includes("true")) {
      $(link).show()
    } else {
      $(link).hide()
    }
  })
}
