namespace "Place.FormBehavior", (exports) ->
  
  behavior_on_category_select = (e) ->
    e.preventDefault()
    field = target_of_event e
    
    value = get_select_value(field)
    update_type_list(value)

  update_type_list = (category_id) ->
    section = 'place'
    XHR.post("http://#{window.location.host}/api/type_list", 
      {category_id: category_id, section: section }, 
      callback
    )

  callback = (data) ->
    $(document.getElementById('place_type_fields')).show()
    type_field = document.getElementById('place_type_id')
    type_field.innerHTML = ''
    data = JSON.parse(data.response)
    if !data.error
      for element in data
        elem = create_option(element.name)
        $(elem).attr('value', element.id)
        type_field.appendChild(elem)

  create_option = (data) =>
    elem = document.createElement('option')
    elem.innerHTML = data
    elem

  # behavior on new type btn click
  behavior_on_type_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    block = document.getElementById('place_new_type_fields')
    #todo toggle()
    if $(field).hasClass('unactive')
      $(block).animate({height: 'hide'}, 200);
    else
      $(block).animate({height: 'show'}, 400);
      #$(block).show()
    $(field).toggleClass('unactive')

  send_new_type_request = (e) ->
    e.preventDefault()
    type_name = $(document.getElementById('place_type_name')).val()
    category_id = get_select_value(document.getElementById('place_category_id'))
    section = 'place'
    XHR.post("http://#{window.location.host}/api/new_type", 
      {type_name: type_name, category_id: category_id, section: section}, 
      new_type_callback
    )

  new_type_callback = (data) ->
    type_field = document.getElementById('place_type_id')
    data = JSON.parse(data.response)
    if !data.error
      elem = create_option(data.name)
      $(elem).attr('value', data.id)
      $(elem).attr('selected', 'selected')
      type_field.appendChild(elem)
      block = document.getElementById('place_new_type_fields')

      $(block).animate({height: 'hide'}, 200);
      
      field = document.getElementById('place_type_plus_btn')
      $(field).removeClass('unactive')


  exports.initialize = () ->
    field = document.getElementById('place_category_id')
    bind_event field, 'change', behavior_on_category_select
    #add type behavior
    field = document.getElementById('place_type_plus_btn')
    bind_event field, 'click', behavior_on_type_click

    btn = document.getElementById('place_add_type')
    bind_event btn, 'click', send_new_type_request

domReady ->
  Place.FormBehavior.initialize()
