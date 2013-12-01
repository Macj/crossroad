namespace "Category.MapBehavior", (exports) ->
  loaded = false

  show_map = (e) ->
    map = document.getElementById('map_block')
    if map 
      $(map).removeClass('hidden')

    unless loaded
      Crossroad.Map.initialize()
      if gon && gon.points
        Crossroad.Map.set_markers(gon.points)
      loaded = true

  hide_map = () ->
    map = document.getElementById('map_block')
    if map
      $(map).addClass('hidden')
  
  # exports part
  exports.initialize = () ->
    btn = document.getElementById('map_show_btn')
    if btn
      bind_event btn, 'click', show_map 

    btn = document.getElementById('map_close_btn')
    if btn
      bind_event btn, 'click', hide_map 


domReady ->
  Category.MapBehavior.initialize()
  # Crossroad.Map.initialize()

