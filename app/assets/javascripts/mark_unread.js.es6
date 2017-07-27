$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();

  //this should select the whole div that the link is inside of
  //user jquery to add class $link that will change the color to mark as read
  var linkId = $(this).parent().data('link-id')
  //create post call to hotreads database
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStat)
    .fail(displayFailure);
}

function updateLinkStat(link) {
  $(`.read-status[data-link-id=${link.id}]`).text(link.read);
  $(`td[data-link-id=${link.id}] .mark-as-unread`).text('Mark as Read').removeClass('mark-as-unread').addClass('mark-as-read')
  $(`tr#link-${link.id}`).removeClass('read')
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
