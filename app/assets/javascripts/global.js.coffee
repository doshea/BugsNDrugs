window.global =
  ENTER : 13

  ready: ->
    $('nav').on('keyup', '#query', global.live_search)
    $('.bug').on('blur', '.admin-editable[contenteditable]', global.update_editable_bug)
    $('.bug').on('dblclick','.admin-editable' , global.become_editable)
    $('.bug').on('keyup', '.admin-editable-array input', global.add_array_el)
    $('.bug').on('dblclick', '.admin-editable-array li', global.remove_array_el)
    $('.bug').on('click', '.preview .fi-eye', global.view_as_user)

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

  view_as_user: (e)->
    e.preventDefault()
    $('.hidden-to-users').toggle()

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

  #Array Editing
  add_array_el: (e) ->
    key = e.which
    if key == global.ENTER
      contents = $(this).val()
      if contents.length > 1
        container = $(this).closest('.admin-editable-array')
        ul = container.children('ul').first()
        li = $("<li>#{contents}</li>")
        ul.append(li)
        $(this).val('')
        global.update_array(container)

  remove_array_el: ->
    container = $(this).closest('.admin-editable-array')
    $(this).remove()
    global.update_array(container)

  update_array: (container) ->
    bug_el = container.closest('.bug')
    id = bug_el.attr('id').substring(4)
    param = container.data('param')
    lis = container.find('li')
    content = $.map lis, (v, k) ->
      $(v).text().trim()
    param_hash = new Object();
    param_hash[param] = content;

    settings =
      dataType: 'script'
      type: 'PATCH'
      url: "/admin/bugs/#{id}/update_array"
      data:
        bug: param_hash
    $.ajax(settings)

# $(document).ready(global.ready)