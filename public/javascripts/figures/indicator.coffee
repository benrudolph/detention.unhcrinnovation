class Detention.Figures.Indicator extends Backbone.View

  className: 'indicator'

  template: Detention.Templates.indicator

  initialize: (opts) ->

    # default margin, opts will override if applicable
    @margin = opts.margin or { left: 20, right: 20, top: 20, bottom: 40 }

    @data = opts.data
    @name = opts.name


    # Adjust for margins
    @width = (opts.width - @margin.left - @margin.right)
    @height = (opts.height - @margin.top - @margin.bottom)

    @$el.html @template.render
      data: @data
      name: @name

    @selection = d3.select(@el).select('.indicator-figure')

    @svg = @selection.append('svg')
      .attr('width', opts.width)
      .attr('height', opts.height)
      .attr('class', "svg-indicator-figure")


    @g = @svg.append('g')
      .attr('transform', "translate(#{@margin.left}, #{@margin.top})")


    domain = [0, d3.max(@data, (d) -> d.value)]
    nice = "#{domain[1]}".length - 1
    nice = 2 if nice < 2

    @x = d3.scale.linear()
      .domain(domain)
      .range([0, @width])
      .nice(nice)

    @xAxis = d3.svg.axis()
      .scale(@x)
      .tickValues(@x.domain())
      .orient('bottom')

    @g.append('g')
      .attr('class', 'x axis')
      .attr('transform', "translate(0,#{@height})")

    @g.select('.x.axis')
      .transition()
      .duration(500)
      .call(@xAxis)


  render: =>

    dots = @g.selectAll('.dot').data _.filter(@data, (d) -> d.value? and _.isNumber(d.value))
    dots.enter().append('circle')
    dots.attr('class', (d) -> "dot #{d.key}")
      .attr('r', 5)
      .attr('cx', (d) => @x(d.value))
      .attr('cy', @height / 2)
      .attr('original-title', (d) -> "<h1>#{d.key}: #{d.value}</h1>")

    @



