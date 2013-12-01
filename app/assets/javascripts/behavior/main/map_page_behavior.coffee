namespace "Main.MapPageBehavior", (exports) ->

  exports.initialize = () ->
    Crossroad.Map.initialize()
    if null != gon && gon.points
      Crossroad.Map.set_markers(gon.points)
    
domReady ->
  Main.MapPageBehavior.initialize()
