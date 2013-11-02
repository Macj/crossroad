namespace "Place.MapBehavior", (exports) ->
  behavior_on_menu_click = (e) ->
  
  exports.initialize = () ->
    title = document.getElementById('place_name').innerHTML
    # info_window add something
    if gon.place
      Crossroad.Map.add_marker( gon.place.lat, gon.place.lng, gon.place.title, gon.place.content)


domReady ->
  Crossroad.Map.initialize()
  Place.MapBehavior.initialize()
