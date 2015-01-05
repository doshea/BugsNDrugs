// Turbolinks-y way of ensuring that this JS is ready
document.addEventListener('page:change', ready_stuff);

function ready_stuff(){
  $('body').on('click', '.bug-list .fi-plus', function(e){
    e.preventDefault()
    $('.new-object').hide()
    $('.name').show()
    $('.edit').hide()
    $(this).closest('.bug_class').children('form').children('.new-object').toggle().focus();
  })
  $('body').on('click', '.bug-list .fi-pencil', function(e){
    e.preventDefault()
    $('.new-object').hide()
    $('.name').show()
    $('.edit').hide()
    $(this).parent().siblings('.name').hide().siblings('.edit').show().focus();
  })
  global.ready();
}