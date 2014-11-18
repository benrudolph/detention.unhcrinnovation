class Detention.Views.Legislation extends Detention.Views.Module

  template: Detention.Templates.legislation

  initialize: (opts) ->
    super
    @model.set 'table', {}

    @model.on 'change:table', @render

    $.get "https://data.brace.io/ss/VR9wwCaLu8MMQ68hUADGAZ", (data) =>
      console.log data
      @model.set 'table', data
