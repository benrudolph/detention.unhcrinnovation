class Detention.Views.Document extends Backbone.View

  template: Detention.Templates.document

  initialize: (opts) ->

    @modules = new Backbone.Collection()
    @modules.add new Backbone.Model({ id: 'intro' })
    @modules.add new Backbone.Model({ id: 'timeline' })
    @modules.add new Backbone.Model({ id: 'legislation' })
    @modules.add new Backbone.Model({ id: 'indicators' })
    @modules.add new Backbone.Model({ id: 'alternatives' })

    @views = []
    @views.push new Detention.Views.Intro({ model: @modules.get('intro') })
    @views.push new Detention.Views.Module({ model: @modules.get('timeline') })
    @views.push new Detention.Views.Module({ model: @modules.get('legislation') })
    @views.push new Detention.Views.Module({ model: @modules.get('indicators') })
    @views.push new Detention.Views.Module({ model: @modules.get('alternatives') })

  render: ->

    @$el.html @template.render()

    $modules = @$el.find('.modules')

    _.each @views, (v) ->
      $modules.append v.render().el




