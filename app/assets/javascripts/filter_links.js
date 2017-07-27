$( document ).ready(function(){
  $("#link-filter").on("keyup", filterLinks)
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


// function searchFoods() {
//   $('input[name="food-filter"]').keyup(function() {
//     const filterParam = $('input[name="food-filter"]').val()
//     const filtered = filterParam.toUpperCase()
//     const foodRows = document.getElementsByClassName('name')
//
//     for (var i = 0; i < foodRows.length; i++) {
//       var foodName = foodRows[i].innerText
//       if (foodName.toUpperCase().indexOf(filtered) < 0) {
//         foodRows[i].parentElement.parentElement.style.display = "none"
//       } else {
//         foodRows[i].parentElement.parentElement.style.display = ""
//       }
//     }
//   })
// }
