namespace "Crossroad.Map", (exports) ->
  exports.map = {}
  exports.markers = []

  lat_lng = (x,y)->
    new google.maps.LatLng(x, y);

## markers
  add_marker = ( x, y, title, content) ->
    myLatlng = lat_lng(x,y)
    marker = new google.maps.Marker({
      position: myLatlng,
      map: Crossroad.Map.map,
      title: title
    })
    Crossroad.Map.markers.push( marker )

    if content
      add_info_to_marker(content, marker)

    center_map()

  add_info_to_marker = (content, marker) ->
    infowindow = new google.maps.InfoWindow({
        content: content
    })
    google.maps.event.addListener(marker, 'click', () ->
      infowindow.open(Crossroad.Map.map, marker)
    )

  set_markers = (markers) ->
    for item in markers
      Crossroad.Map.add_marker( item.lat, item.lng, item.title, item.content)

  clear_markers = () ->
    for item in Crossroad.Map.markers
      item.setMap(null);
    Crossroad.Map.markers = new Array()

  center_map = () ->
    x = 0;
    y = 0;
    for m in Crossroad.Map.markers
      x += m.position.ob
      y += m.position.pb
    elems_count = Crossroad.Map.markers.length
    myLatlng = lat_lng(x/elems_count,y/elems_count)
    Crossroad.Map.map.setCenter(myLatlng)


## update part
  update_map = () ->
    XHR.post("http://#{window.location.host}/api/points", 
      {filters: JSON.stringify(Crossroad.Data.filters)}, 
      callback
    )

  callback = (data) ->
    if !data.error
      Crossroad.Map.clear_markers()
      Crossroad.Map.set_markers(JSON.parse(data.response))

## exports part
  exports.clear_markers = clear_markers
  exports.add_marker = add_marker
  exports.add_info_to_marker = add_info_to_marker
  exports.update_map = update_map
  exports.set_markers = set_markers

## initialize
  exports.initialize = () ->
    container = document.getElementById('map_container')
    myLatlng = lat_lng(48.46809, 35.053403);
    myOptions = {
        zoom: 11,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    if container
      Crossroad.Map.map = new google.maps.Map(container, myOptions); 

#domReady ->
#  Crossroad.Map.initialize()