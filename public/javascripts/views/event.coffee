class Detention.Views.Event extends Backbone.View

  template: Detention.Templates.event

  className: 'event row'

  initialize: ->

  render: =>
    @$el.html @template.render({
      model: @model.toJSON(),
      odd: if @model.collection.indexOf(@model) % 2 == 0 then false else true
    })
    @
