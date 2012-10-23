jQuery(function($) {
  deleteFade();
});

function deleteFade(){
  $('.delete_venue').bind('ajax:success', function() {
      $(this).closest('tr').fadeOut();
      return false;
    });
  $('.delete_event').bind('ajax:success', function() {
      $(this).closest('section').fadeOut();
      return false;
    });
}