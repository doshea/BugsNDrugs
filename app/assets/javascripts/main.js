/* This will contain global javascript for your application */
$(document).on('click', '.preview-container a', function(e){
  var preview_sibling = $(this).siblings('.preview');
  if(preview_sibling.css('display') != 'block'){
    $('.preview:visible').fadeOut('fast');
    preview_sibling.show();
  }
});

$(document).on('click', '.preview .fi-x', function(e){
  e.preventDefault();
  $(this).closest('.preview').fadeOut();
});