class Detention.Views.Document extends Backbone.View

  dataHeaders:
    section: 'Section ID'
    title: 'Title'
    description: 'Description'

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
    @views.push new Detention.Views.Timeline({ model: @modules.get('timeline') })
    @views.push new Detention.Views.Legislation({ model: @modules.get('legislation') })
    @views.push new Detention.Views.Indicators({ model: @modules.get('indicators') })
    @views.push new Detention.Views.Alternatives({ model: @modules.get('alternatives') })

    $.get "https://data.brace.io/ss/8qAk4nRxW8UMYjNAwPYjSR", (data) =>
      _.each data.rows, (row) =>

        module = @modules.get(row[@dataHeaders.section])
        module.set 'title', row[@dataHeaders.title]
        module.set 'description', row[@dataHeaders.description]

  render: ->

    @$el.html @template.render()

    $modules = @$el.find('.modules')

    _.each @views, (v) ->
      $modules.append v.render().el




