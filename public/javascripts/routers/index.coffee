class Detention.Routers.Index extends Backbone.Router

  initialize: (opts) ->

    @document = new Detention.Views.Document
      el: $('body')

  routes:
    '*default': 'index'

  index: ->
    @document.render()
