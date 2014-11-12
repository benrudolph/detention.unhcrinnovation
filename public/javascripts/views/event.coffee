class Detention.Views.Event extends Backbone.View

  template: Detention.Templates.event

  className: 'event row'

  initialize: ->

  render: =>
    @$el.html @template.render({ model: @model.toJSON() })
    @
