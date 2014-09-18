/* This will contain global javascript for your application */
$(document).on('click', '.preview-container a', function(e){
  $('.preview:visible').fadeOut();
  var preview_sibling = $(this).siblings('.preview');
  if( preview_sibling.length > 0 ){
    preview_sibling.fadeIn();
  }
});

$(document).on('click', '.preview .fi-x', function(e){
  e.preventDefault();
  $(this).closest('.preview').fadeOut();
});