window.global =

  ready: ->
    $('nav').on('keyup', '#query', global.live_search)
    $('.bug').on('blur', '.admin-editable[contenteditable]', global.update_editable_bug)
    $('.bug').on('dblclick','.admin-editable' , global.become_editable)

  live_search: ->
    query = $('#query').val()
    if query.length < 3
      $('#live-results').hide()
    else
      settings =
        dataType: 'script'
        type: 'GET'
        url: "/live_search"
        data: {query: query}
      $.ajax(settings)

  # Admins can dblclick on certain text fields to edit them
  become_editable: ->
    if($(this).attr('contenteditable'))
      $(this).removeAttr('contenteditable')
    else
      $(this).prop('contenteditable', true)
    
  # Updates a bug from an editable text field
  update_editable_bug: ->
    content = $(this).text().trim()
    param = $(this).data('param')
    param_hash = new Object();
    param_hash[param] = content;
    bug_el = $(this).closest('.bug')
    id = bug_el.attr('id').substring(4)
    settings = 
      dataType: 'script'
      type: 'PATCH'
      url: "/admin/bugs/#{id}"
      data:
        bug: param_hash
    $.ajax(settings)



# $(document).ready(global.ready)