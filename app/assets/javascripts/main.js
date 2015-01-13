/* This will contain global javascript for your application */
$(document).on('click', '.preview-container > a', function(e){
  $('body').addClass('shaded');
  var preview_sibling = $(this).siblings('.preview');
  if(preview_sibling.css('display') != 'block'){
    $('.preview:visible').fadeOut('fast');
    preview_sibling.show();
  }
});

// When user mouses up outside of a preview, hides the preview and un-shades window
$(document).mouseup(function (e){
    var container = $('.preview-container');
    if (!container.is(e.target) && container.has(e.target).length === 0){
        container.children('.preview').fadeOut('fast');
        $('body').removeClass('shaded');
    }
});