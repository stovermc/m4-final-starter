//Document.ready
$(document).ready(function() {
  $('#create-link').on('click', addLink)
})

function clearErrors() {
  $('.errors').empty()
}

// function bindSubmitListener() {
//   $('#new-link').on('click', function(event){
//     event.preventDefault()
//     addLink()
//   })
// }

function addLink(event) {
  event.preventDefault()
  clearErrors()
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
    $("#link-list").append(newLinkMarkup)
    $('#url').val('')
    $('#title').val('')
  })
}
