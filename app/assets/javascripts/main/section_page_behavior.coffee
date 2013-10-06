namespace "Section.PageBehavior", (exports) ->
  
  behavior_on_sections_selector_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    
    block = document.getElementsByClassName('sections')[0]
    $(block).toggle()

  behavior_on_category_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    
    id = field.getAttribute('id')
    hide_all_content_except(id)

  hide_all_content_except = (id) ->
    fields = document.getElementsByClassName('item')
    for field in fields
      _field = $(field)
      _field.hide()
      if field.getAttribute('category') == id
        _field.show()

  exports.initialize = () ->
    block = document.getElementsByClassName('sections')[0]
    $(block).hide()
    field = document.getElementById('sections_selector')
    bind_event field, 'click', behavior_on_sections_selector_click

    #category filter behavior
    fields = document.getElementsByClassName('category_item')
    for field in fields
      bind_event field, 'click', behavior_on_category_click    
    
    
domReady ->
  Section.PageBehavior.initialize()
