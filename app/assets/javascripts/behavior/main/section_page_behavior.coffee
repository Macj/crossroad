namespace "Main.SectionPageBehavior", (exports) ->
  
  behavior_on_sections_selector_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    
    block = document.getElementsByClassName('section_block')[0]
    $(block).toggle()

  behavior_on_view_selector_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    content = document.getElementsByClassName('items')[0]
    $(content).attr('class','items' )
    switch $(field).attr('id')
      when 'view1'
        $(content).addClass('thumb')
      when 'view2'
        $(content).addClass('line')
      when 'view3'
        $(content).addClass('table')


  behavior_on_category_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    
    id = field.getAttribute('id')
    hide_all_content_except(id)

    clear_all_actives()
    $(field).addClass('active')


  clear_all_actives = () ->
    fields = document.getElementsByClassName('category_item')
    for field in fields
      $(field).removeClass('active')

  hide_all_content_except = (id) ->
    fields = document.getElementsByClassName('item')
    for field in fields
      _field = $(field)
      _field.hide()
      if field.getAttribute('category') == id
        _field.show()

  exports.initialize = () ->
    block = document.getElementsByClassName('section_block')[0]
    $(block).hide()
    field = document.getElementById('sections_selector')
    bind_event field, 'click', behavior_on_sections_selector_click

    #category filter behavior
    fields = document.getElementsByClassName('category_item')
    for field in fields
      bind_event field, 'click', behavior_on_category_click

    for id in ['view1', 'view2', 'view3']
      field = document.getElementById(id)
      bind_event field, 'click', behavior_on_view_selector_click
    
    
domReady ->
  Main.SectionPageBehavior.initialize()
