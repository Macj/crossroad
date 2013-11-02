namespace "FiltersBehavior", (exports) ->
  FIELDS = ['type_id', 'begin_date', 'end_date']

  filter_field_behavior = (e) ->
    e.preventDefault()
    field = target_of_event e
    id = field.getAttribute('id')
    Crossroad.Data.set_filter( id, $(field).val())

  exports.initialize = () ->
    data = JSON.parse($(document.getElementById('filters')).attr('data'))
    for elem in data
      e = JSON.parse(elem)
      Crossroad.Data.filters[e[0]] = e[1]

    # set behaviors
    for id in FIELDS
      field = document.getElementById(id)
      bind_event field, 'change', filter_field_behavior

    
domReady ->
  FiltersBehavior.initialize()
