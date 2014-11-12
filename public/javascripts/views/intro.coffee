class Detention.Views.Intro extends Detention.Views.Module

  className: 'row intro'

  template: Detention.Templates.intro

  render: ->
    super

    $window = $ window

    @$el.css 'width', $window.width()
    @$el.css 'height', $window.height()

    @
