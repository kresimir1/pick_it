// function modify_qty(val) {
//
//     var qty = document.getElementById('qty').value;
//     var new_qty = parseInt(qty,10) + val;
//     document.getElementById('qty').value = new_qty;
//
//     return new_qty;
//
// }

$('.up').on('click', function(event) {
  event.preventDefault();
  var qty = document.getElementById('qty').value;
  var url = $(this).attr('href');

  var request = $.ajax({
   method: "POST",
   url: url
 });


  request.done(function() {
    var new_qty = parseInt(qty,10) + 1;
    document.getElementById('qty').value = new_qty;
    return new_qty;
   });
});
