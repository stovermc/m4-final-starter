function addLink() {
  event.preventDefault()
  const linkData = {
        link: {
          url: $('#url').val(),
          title: $('#title').val()
        }
  }
  $.ajax({
    url: "/links",
    method: "POST",
    data: linkData
  })
  .done(function(newLinkMarkup){
    console.log(newLinkMarkup)
    $(".links-list").append(newLinkMarkup)
    $('#url').val('')
    $('#title').val('')
  })
}


//Document.ready
$(function() {
  $('#create-link').on('click', addLink)

})
