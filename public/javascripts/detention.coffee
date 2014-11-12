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

d3.selection.prototype.moveToFront = () ->
  @each () ->
    @parentNode.appendChild(this)

