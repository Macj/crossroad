namespace "Category.FilterBehavior", (exports) ->
  FIELDS = ['category_id', 'section_type', 'page']
  set_section = (e) ->
    e.preventDefault()
    field = target_of_event e
    id = field.getAttribute('id')
    Crossroad.Data.set_filter('section_type', id, callback )


  set_category = (e) ->
    e.preventDefault()
    field = target_of_event e
    id = field.getAttribute('data')
    Crossroad.Data.set_filter('category_id', id)

  exports.initialize = () ->
    data = $(document.getElementsByClassName('section'))
    for field in data
      bind_event field, 'click', set_section

    data = $(document.getElementsByClassName('category_item'))
    for field in data
      bind_event field, 'click', set_category
    
domReady ->
  Category.FilterBehavior.initialize()