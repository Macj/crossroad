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
    category_id = document.getElementById('element_category_id')
    section = document.getElementById('element_section')
    

  exports.initialize = () ->
    field = document.getElementById('element_section')
    bind_event field, 'change', behavior_on_type_select
    

domReady ->
  Main.FormBehavior.initialize()
