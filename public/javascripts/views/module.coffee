class Detention.Views.Module extends Backbone.View

  tagName: 'section'

  className: 'row'

  template: Detention.Templates.module

  initialize: (opts) ->

  render: ->

    @$el.html @template.render()

    @
