function plot(div, csv, x_field, y_field, hover_label) {
  Plotly.d3.csv(csv, function(rows){
      var trace = {
        type: 'scatter',                    // we'll do a scatter plot
        mode: 'markers',                    // points

        x: rows.map(function(row){          // x data
          return row[x_field];
        }),

        y: rows.map(function(row){          // y data
          return row[y_field];
        }),

        marker: {
          color: 'rgb(153, 102, 255)',
        },

        text: rows.map(function(row){       // hover text
          return row[hover_label];
        })
      };

      var layout = {
        title: csv,
        hovermode: 'closest',               // hover over text shows closest point
        xaxis: {title: x_field},
        yaxis: {title: y_field},
        margin: {
          l: 100, b: 100, r: 50, t: 50
        }
      };

      Plotly.plot(document.getElementById(div), [trace], layout, {showLink: false});
  });
}

plot('churn-complexity1', 'churn_vs_complexity_backend.csv', 'churn', 'total_complexity', 'file')
plot('churn-complexity2', 'churn_vs_complexity_backend.csv', 'churn', 'average_method_complexity', 'file')
plot('churn-complexity3', 'churn_vs_complexity_backend.csv', 'average_method_complexity', 'total_complexity', 'file')
plot('churn-complexity4', 'churn_vs_complexity_controllers_helpers.csv', 'churn', 'total_complexity', 'file')
plot('churn-complexity5', 'churn_vs_complexity_controllers_helpers.csv', 'churn', 'average_method_complexity', 'file')
plot('churn-complexity6', 'churn_vs_complexity_controllers_helpers.csv', 'average_method_complexity', 'total_complexity', 'file')