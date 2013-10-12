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
    XHR.post("http://#{window.location.host}/api/type_list", {category_id: category_id, section: section }, callback)

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

  exports.initialize = () ->
    field = document.getElementById('element_section')
    bind_event field, 'change', behavior_on_type_select
    

domReady ->
  Main.FormBehavior.initialize()
