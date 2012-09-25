jQuery(function($) {
  
  $('input').live("click", function() {
    history.pushState(null, "", "/venues/" + venue_id);
  });
});

