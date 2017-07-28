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
  }).then(sendToHotReads(url))
    .then(updateLinkStatus)
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
    url: 'https://stover-hotreads.herokuapp.com/api/v1/links',
    data: { url: url }
  }).done(updateTopTen)
    .fail(displayFailure);
}

function updateTopTen(data) {
  var hot_reads = getHotReads(data)
  $('tr').each(function(index, link) {
    let linkURL = $(this).children()[1].innerHTML
    if (hot_reads.includes(linkURL)) {
      $(link).find('.hot').remove()
      $(link).find('#title').prepend('<td class="hot">HOT!</td>')
    } else {
      $(link).find('.hot').remove()
    }
    if (linkURL == hot_reads[0]) {
      $(link).find('.hot').text('HOTTEST!')
    }
  })
}

function getHotReads(returnedHotReads) {
  var urls = []
  returnedHotReads.forEach(function(hotRead) {
    urls.push(hotRead.url)
  })
  return urls
}
