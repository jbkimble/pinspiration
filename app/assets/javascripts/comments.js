// $(document).ready(function() {
//   /* Activating Best In Place */
//   jQuery(".best_in_place").best_in_place();
// });

$(document).on('turbolinks:load', function() {
   jQuery(".best_in_place").best_in_place();
})
