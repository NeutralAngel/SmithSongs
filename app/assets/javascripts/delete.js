jQuery(function($) {

  $('.delete_venue').bind('ajax:success', function() {
    debugger;
      $(this).closest('tr').fadeOut();
      return false;
    });
});