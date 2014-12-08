// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .






// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
//google.setOnLoadCallback(drawChart);
google.setOnLoadCallback(readChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {

  // Create the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Skill');
  data.addColumn('number', 'Level');
  data.addRows([
    ['C/C++', 5],
    ['Python', 5],
    ['Telecommunications', 4],
    ['Linux', 5],
    ['Network Protocols', 4],
    ['PL/SQL', 4],
    ['Java', 3],
    ['PERL', 1],
    ['PHP', 2],
    ['Database', 4]
  ]);

  // Set chart options
  var options = {'title':'Skill Level',
                 'width':400,
                 'height':300,
                 'backgroundColor': '#A7DBD8'
  };

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}
function drawChart1(_all_rows, where, title, width, height, backgroundColor) {

  // Create the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Skill');
  data.addColumn('number', 'Level');
  data.addRows(_all_rows);

  // Set chart options
  var options = {'title':'Skill Level',
                 'width':400,
                 'height':300,
                 'backgroundColor': '#C8C8A9'
  };

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.PieChart(document.getElementById(where));
  chart.draw(data, options);
}
function onSuccess(data){
  drawChart1(data, 'chart_div', 'Skill Level',
                                400,
                                300,
                                '#C8C8A9');
  
}
function onError(){
  document.getElementById('chart_div').innerHTML = "Unable to retrieve data of skills";
}

function readChart(){
  $.ajax({ type: 'GET',
  contentType: "application/json",
  url: "/welcome/skill_level",
  success: onSuccess,
  error: onError,
  dataType: "json"
  });
}

