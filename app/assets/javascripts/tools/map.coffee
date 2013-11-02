namespace "Crossroad.Map", (exports) ->
  exports.map = {}
  exports.markers = []
  
  lat_lng = (x,y)->
    new google.maps.LatLng(x, y);

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

  add_info_to_marker = (content, marker) ->
    infowindow = new google.maps.InfoWindow({
        content: content
    })
    google.maps.event.addListener(marker, 'click', () ->
      infowindow.open(Crossroad.Map.map, marker)
    )

  clear_markers = () ->
    for item in Crossroad.Map.markers
      item.setMap(null);
    Crossroad.Map.markers = new Array()

  exports.clear_markers = clear_markers
  exports.add_marker = add_marker
  exports.add_info_to_marker = add_info_to_marker

  exports.initialize = () ->
    container = document.getElementById('map_container')
    myLatlng = lat_lng(48.46809, 35.053403);
    myOptions = {
        zoom: 12,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    Crossroad.Map.map = new google.maps.Map(container, myOptions); 

#domReady ->
#  Crossroad.Map.initialize()