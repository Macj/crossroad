namespace "Category.FilterBehavior", (exports) ->
  FIELDS = ['category_id', 'section_type', 'page']
  set_section = (e) ->
    e.preventDefault()
    field = target_of_event e
    id = field.getAttribute('id')
    Crossroad.Data.set_filter('section_type', id )

  exports.initialize = () ->
    data = $(document.getElementsByClassName('section'))
    for field in data
      bind_event field, 'click', set_section

    category_id = $(document.getElementById('category_name')).attr('data')
    Crossroad.Data.filters['category_id'] = category_id

    
domReady ->
  Category.FilterBehavior.initialize()