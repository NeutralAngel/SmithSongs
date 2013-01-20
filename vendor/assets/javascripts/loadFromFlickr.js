!(function(){
    'use strict';
    // Get some photos from Flickr for the demo
    $('div.pbThumbs').remove();
    $.ajax({
        url: 'http://api.flickr.com/services/rest/',
        data: {
            format: 'json',
            method: 'flickr.photosets.getPhotos',
            photoset_id: '72157600137167600',
            extras: 'original_format',
            api_key: '3fab12203c4aa75780e46f5dc87a742a'
        },
      dataType: 'jsonp',
        jsonp: 'jsoncallback'
    }).done(function (data){
        var gallery = $('#gallery'), url;
        $.each( data.photoset.photo, function(index, photo){
            url = 'http://farm' + photo.farm + '.staticflickr.com/' + photo.server + '/' + photo.id + '_' + photo.secret;
        var url_orig = 'http://farm' + photo.farm + '.staticflickr.com/' + photo.server + '/' + photo.id + '_' + photo.originalsecret + '_o.jpg';

                        http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{o-secret}_o.(jpg|gif|png)
        var img = $('<img>').prop({'src': url + '_s.jpg', 'title': photo.title});
      
      var link = document.createElement('a');
      link.href = url_orig;
      link.appendChild(img[0]);
      gallery[0].appendChild(link);

      // lazy show the photos one by one
      img.on('load', function(e){
        setTimeout( function(){ link.className = 'loaded'; }, 20*index);
      });
        });
    
    // finally, initialize photobox on all retrieved images
    $('#gallery').find('a').photobox({ thumbs: false });

    });
})();