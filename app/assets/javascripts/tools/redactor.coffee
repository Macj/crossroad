namespace "Crossroad.Redactor", (exports) ->

  initialize = () =>
    for element in $('textarea')
      $(elem).wysihtml5()

  exports.initialize = initialize

DomReady ->
  console.log('sdklhfksajfh')
  Crossroad.Redactor.initialize()