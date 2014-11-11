var Detention = {
  Constants: {},
  Figures: {},
  Routers: {},
  Models: {},
  Views: {},
  Formats: {
    COMMA: d3.format(',')
  },
  Collections: {},
  Templates: {},
};

d3.selection.prototype.moveToFront = function() {
  return this.each(function(){
    this.parentNode.appendChild(this);
  });
};

