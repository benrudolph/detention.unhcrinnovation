window.Detention =
  Constants: {}
  Figures: {}
  Routers: {}
  Models: {}
  Views: {}
  Formats:
    COMMA: d3.format(',')
  Collections: {}
  Templates:
    document: new EJS({ url: '/templates/document.html.ejs'}),
    module: new EJS({ url: '/templates/module.html.ejs'}),
    intro: new EJS({ url: '/templates/intro.html.ejs'}),
    legislation: new EJS({ url: '/templates/legislation.html.ejs'}),
    timeline: new EJS({ url: '/templates/timeline.html.ejs'}),
    event: new EJS({ url: '/templates/event.html.ejs'}),
    indicators: new EJS({ url: '/templates/indicators.html.ejs'}),
    indicator: new EJS({ url: '/templates/indicator.html.ejs'}),

d3.selection.prototype.moveToFront = () ->
  @each () ->
    @parentNode.appendChild(this)

