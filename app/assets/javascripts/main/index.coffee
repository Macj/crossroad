namespace "Neatform.MenuBehavior", (exports) ->
  
  behavior_on_menu_click = (e) ->
    e.preventDefault()
    field = target_of_event e
    child = field.getAttribute('children')
    target = document.getElementById("#{child}")
    if target
      $(target).toggle()
  
  exports.initialize = () ->
    fields = document.getElementsByClassName('menu_item')
    for field in  fields
      bind_event field, 'click', behavior_on_menu_click
    
    
domReady ->
  Neatform.MenuBehavior.initialize()