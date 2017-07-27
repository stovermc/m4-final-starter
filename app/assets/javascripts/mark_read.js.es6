$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  //this should select the whole div that the link is inside of
  //user jquery to add class $link that will change the color to mark as read
  var linkId = $(this).parent().data('link-id')
  //create post call to hotreads database
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
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
