namespace "Main.FormBehavior", (exports) ->
  
  behavior_on_type_select = (e) ->
    e.preventDefault()
    field = target_of_event e
    
    value = get_select_value(field)
    console.log(value)
    show_type_block(value)
    update_type_list()
   
  show_type_block = (type) ->
    hide_all_blocks()
    field = document.getElementById(type + '_fields')
    $(field).show()
    

  hide_all_blocks = () ->
    fields = document.getElementsByClassName('hidden')
    $(fields).hide()

  update_type_list = () ->
    category_id = get_select_value(document.getElementById('element_category_id'))
    section = get_select_value(document.getElementById('element_section'))
    XHR.post("http://#{window.location.host}/api/type_list", 
      {category_id: category_id, section: section }, 
      callback
    )

  callback = (data) ->
    $(document.getElementById('type_fields')).show()
    type_field = document.getElementById('element_type_id')
    type_field.innerHTML = ''
    if !data.error
      for element in data
        elem = create_option(element.name)
        $(elem).attr('value', element.id)
        console.log(elem)
        type_field.appendChild(elem)

  create_option = (data) =>
    elem = document.createElement('option')
    elem.innerHTML = data
    elem

  # behavior on new type btn click
  behavior_on_type_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    block = document.getElementById('new_type_fields')
    #todo toggle()
    if $(field).hasClass('unactive')
      $(block).animate({height: 'hide'}, 200);
    else
      $(block).animate({height: 'show'}, 400);
      #$(block).show()
    $(field).toggleClass('unactive')

  send_new_type_request = (e) ->
    e.preventDefault()
    type_name = $(document.getElementById('type_name')).val()
    category_id = get_select_value(document.getElementById('element_category_id'))
    section = get_select_value(document.getElementById('element_section'))
    XHR.post("http://#{window.location.host}/api/new_type", 
      {type_name: type_name, category_id: category_id, section: section}, 
      new_type_callback
    )

  new_type_callback = (data) ->
    type_field = document.getElementById('element_type_id')
    if !data.error
      elem = create_option(data.name)
      $(elem).attr('value', data.id)
      $(elem).attr('selected', 'selected')
      type_field.appendChild(elem)
      block = document.getElementById('new_type_fields')

      $(block).animate({height: 'hide'}, 200);
      
      field = document.getElementById('type_plus_btn')
      $(field).removeClass('unactive')


  exports.initialize = () ->
    field = document.getElementById('element_section')
    bind_event field, 'change', behavior_on_type_select

    #add type behavior
    field = document.getElementById('type_plus_btn')
    bind_event field, 'click', behavior_on_type_click

    btn = document.getElementById('add_type')
    bind_event btn, 'click', send_new_type_request

domReady ->
  Main.FormBehavior.initialize()
