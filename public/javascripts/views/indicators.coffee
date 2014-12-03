class Detention.Views.Indicators extends Detention.Views.Module

  template: Detention.Templates.indicators

  initialize: (opts) ->
    super
    @indicators = new Backbone.Collection()
    @indicators.on 'reset', @drawFigures

    $.get "https://data.brace.io/ss/uuoyfUNG9cQkMiEhwx7H7Q", (data) =>
      models = []
      _.each data.rows, (row) ->
        name = row[data.headers[0]]
        delete row[data.headers[0]]

        values = d3.entries row
        models.push({
            name: name,
            values: values
          })

      @indicators.reset models
      $('[original-title]').tipsy
        html: true
        gravity: 's'


  render: =>
    super
    @

  drawFigures: =>

    $figure = @$el.find 'figure'
    $figure.html ''

    @indicators.each (i) ->
      figure = new Detention.Figures.Indicator
        data: i.get('values')
        name: i.get('name')
        height: 90
        width: 600

      $figure.append figure.render().el
