namespace "Category.MapBehavior", (exports) ->
  loaded = false
  set_markers = (markers) ->
    for item in markers
      Crossroad.Map.add_marker( item.lat, item.lng, item.title, item.content)

  show_map = (e) ->
    map = document.getElementById('map_block')
    if map 
      $(map).removeClass('hidden')

    unless loaded
      Crossroad.Map.initialize()
      if gon && gon.points
        set_markers(gon.points)
      loaded = true

  hide_map = () ->
    map = document.getElementById('map_block')
    if map
      $(map).addClass('hidden')

# update part
  update_map = () ->
    XHR.post("http://#{window.location.host}/api/points", 
      {filters: JSON.stringify(Crossroad.Data.filters)}, 
      callback
    )

  callback = (data) ->
    if !data.error
      Crossroad.Map.clear_markers()
      set_markers(JSON.parse(data.response))
  
  # exports part
  exports.update_map = update_map
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

