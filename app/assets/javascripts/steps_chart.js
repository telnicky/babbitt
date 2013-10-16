$(function() {
  var data = window.step_data;
  var height = 440;
  var width = 20 * data.length + 60;

  var chart = d3.select("body")
                .append("svg")
                .attr("class", "steps-chart")
                .attr("width", width)
                .attr("height", height)
              .append("g")
                .attr("transform", "translate(10,15)");

  // create y axis
  var y = d3.scale.linear()
    .domain([0, d3.max(data)])
    .range([0, height]);

  // create x axis
  var x = d3.scale.ordinal()
    .domain(data)
    .rangeBands([0, width]);

  // add tick lines to chart
  chart.selectAll("line")
      .data(y.ticks(10))
    .enter().append("line")
      .attr("x1", 0)
      .attr("x2", width)
      .attr("y1", y)
      .attr("y2", y)
      .style("stroke", "#ccc");

  // add text for ticks
  chart.selectAll(".rule")
      .data(y.ticks(10))
    .enter().append("text")
      .attr("class", "rule")
      .attr("y", function(d) {
        return height - y(d);
      })
      .attr("x", 0)
      .attr("dx", -3)
      .attr("text-anchor", "middle")
      .text(String);

  // add new bars
  chart.selectAll("rect")
      .data(data)
    .enter().append("rect")
      .attr("x", x)
      .attr("width", 20)
      .attr("y", function(d) {
        return height - y(d);
      })
      .attr("height", y);

  // add the text for the new bars
  chart.selectAll(".step-value")
      .data(data)
    .enter().append("text")
      .attr("class", "step-value")
      .attr("y", function(d) {
        return height - y(d);
      })
      .attr("x", function(d) { return x(d) + x.rangeBand() / 2; })
      .attr("dx", 3) // padding-right
      .attr("dy", "1em") // vertical-align: middle
      .attr("text-anchor", "end") // text-align: right
      .text(String);

  chart.append("line")
       .attr("x1", 0)
       .attr("x2", width)
       .attr("y1", height)
       .attr("y2", height)
       .style("stroke", "#000");

});
