class Detention.Views.Timeline extends Detention.Views.Module

  template: Detention.Templates.timeline

  className: 'row timeline'

  initialize: (opts) ->
    @collection = new Detention.Collections.Event()
    @collection.on 'reset', @render

    $.get "https://data.brace.io/ss/To4FfFoaaAbz75NxcsCtqP", (data) =>
      models = data.rows
      @collection.reset models

  render: =>
    super

    $events = @$el.find '.events'
    $events.html ''

    @collection.each (model) ->
      $events.append (new Detention.Views.Event({ model: model })).render().el

    @
