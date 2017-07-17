//Document.ready
$(document).ready(function() {
  bindSubmitListener()
})

function clearErrors() {
  $('.errors').empty()
}

function bindSubmitListener() {
  $('#new-link').submit(function(event){
    event.preventDefault()
    debugger
    addLink()
  }
}

function addLink() {
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
