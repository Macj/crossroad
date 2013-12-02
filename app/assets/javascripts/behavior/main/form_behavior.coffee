namespace "Main.FormBehavior", (exports) ->
  FIELDS = ['event', 'article', 'place', 'project']
  behavior_on_section_select = (e) ->
    e.preventDefault()
    field = target_of_event e

    value = $(field).attr('id')[0..-9]
    console.log(value)
    show_type_block(value)

  show_type_block = (type) ->
    hide_all_blocks()
    field = document.getElementById(type + '_fields')
    $(field).show()

  hide_all_blocks = () ->
    fields = document.getElementsByClassName('hidden')
    $(fields).hide()


  exports.initialize = () ->
    for item in FIELDS
      field = document.getElementById(item + '_section')
      bind_event field, 'click', behavior_on_section_select

    #add type behavior

domReady ->
  Main.FormBehavior.initialize()