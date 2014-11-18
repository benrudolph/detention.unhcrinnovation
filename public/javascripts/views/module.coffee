class Detention.Views.Module extends Backbone.View

  tagName: 'section'

  template: Detention.Templates.module

  initialize: (opts) ->

    @model.on 'change:title change:description', (e) =>
      changed = e.changed

      keys = _.keys changed

      _.each keys, (key) =>
        @$el.find(".module-#{key}").text changed[key]


  render: =>

    @$el.html @template.render({ model: @model.toJSON() })

    @
