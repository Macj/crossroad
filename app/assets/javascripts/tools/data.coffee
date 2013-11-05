namespace "Crossroad.Data", (exports) ->
  exports.filters = {}

  set_filter = (key, val) ->
    Crossroad.Data.filters[key] = val
    # send request for content
    XHR.post("http://#{window.location.host}/api/content", 
      {filters: JSON.stringify(Crossroad.Data.filters)}, 
      Crossroad.Data.callback
    )

  callback = (data) => 
    Category.MapBehavior.update_map()
    block = document.getElementsByClassName( 'content_block' )[0]
    block.innerHTML = ''
    block.setAttribute('id', Crossroad.Data.filters['section_type'] + '_content')
    switch data.status
      when 200 then block.innerHTML = data.responseText
      when 304 then trace 'empty data'


  exports.set_filter = set_filter
  exports.callback = callback