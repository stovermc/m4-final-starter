$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = $(this).parent().data('link-id')
  var url = $(this).parent().parent().children()[1].innerHTML

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .then(sendToHotReads(url))
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.read-status[data-link-id=${link.id}]`).text(link.read);
  $(`td[data-link-id=${link.id}] .mark-as-read`).text('Mark as Unread').removeClass('mark-as-read').addClass('mark-as-unread')
  $(`tr#link-${link.id}`).addClass('read')
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function sendToHotReads(url) {
  $.ajax({
    type: "POST",
    url: "http://localhost:3000/api/v1/links",
    data: { url: url }
  })
}
