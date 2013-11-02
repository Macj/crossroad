namespace "Category.PageBehavior", (exports) ->
  
  behavior_on_section_click = (e) ->
    e.preventDefault()

    clear_all_actives()
    field = target_of_event e
    id = field.getAttribute('id')
    $(field).addClass('active')

    #hide_all_content_blocks()     
    #block = document.getElementById(id + '_content')
    #$(block).show()

  clear_all_actives = () ->
    fields = document.getElementsByClassName('section')
    for field in fields
      $(field).removeClass('active')
  
  hide_all_content_blocks = () ->
    blocks = document.getElementsByClassName('content_block')
    for block in blocks
      $(block).hide()

  exports.initialize = () ->
    fields = document.getElementsByClassName('section')
    for field in fields
      bind_event field, 'click', behavior_on_section_click
    
    
domReady ->
  Category.PageBehavior.initialize()
