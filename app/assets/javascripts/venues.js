jQuery(function($) {
  
  $('input.venue_submit').live("click", function() {
    history.pushState(null, "", "/venues/" + venue_id);
  });
});

