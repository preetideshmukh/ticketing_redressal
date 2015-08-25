//***********BARCHART Theme
$(document).ready(function () {
    var array = $("#BarDiv").data('stuff');

    // Load the fonts
    Highcharts.createElement('link', {
      href: '//fonts.googleapis.com/css?family=Signika:400,700',
      rel: 'stylesheet',
      type: 'text/css'
    }, null, document.getElementsByTagName('head')[0]);

    // Add the background image to the container
    Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function (proceed) {
      proceed.call(this);
      this.container.style.background = 'url(http://www.highcharts.com/samples/graphics/sand.png)';
    });

    Highcharts.theme = {
      colors: ["#f45b5b", "#8085e9", "#8d4654", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", 
                "#DF5353", "#7798BF", "#aaeeee"],
      chart: {
         backgroundColor: null,
         style: {
            fontFamily: "Signika, serif"
            },
         borderWidth: 1,
         Shadow: true         
        },
      title: {
         style: {
            fontSize: '22px',
            fontWeight: 'bold'
         }
        },
      tooltip: {
         borderWidth: 0
        },
      legend: {
       borderWidth: 0,
         borderRadius: 5,
         borderWidth: 1,
         itemStyle: {
            fontWeight: 'bold',
            fontSize: '13px'
         }
        },
      xAxis: {
         labels: {
            style: {
               color: '#6e6e70'
            }
         }
        },
      yAxis: {
         labels: {
            style: {
               color: '#6e6e70'
            }
         }
        },
      plotOptions: {
         series: {
            shadow: true
         },
         candlestick: {
            lineColor: '#404048'
         },
         map: {
            shadow: false
         }
        },
    // General
      background2: '#E0E0E8'     
    };
    //**** code for bar chart
    // Apply the theme
    Highcharts.setOptions(Highcharts.theme);

       $('#barchart').highcharts({
           chart: {
               type: 'column',
               spacingBottom: 25,
               spacingTop: 20,
               spacingLeft: 20,
               spacingRight: 20
           },
           credits: {
               enabled: false
           },
           title: {
               text: 'Todays Status',
               },
         
           xAxis: {
               categories: [
                   'Completed',
                   'Processing',
                   'New',
                  ],
                labels: {
                   rotation: 50,
                   style: {
                   fontSize: '15px',
                  }
                 },
               },
           yAxis: {
               min: 0,
               title: {
                   text: 'Count',
                   style: {
               fontSize: '18px',
                  }
                   
               }
           },
           tooltip: {
               headerFormat: '<span style="font-size:15px">{point.key}</span><table>',
               pointFormat: '<tr><td style="color:false;padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:1f}</b></td></tr>',
               shared: true,
               useHTML: true
           },
           plotOptions: {
               column: {
                   pointPadding: 0.002,
                   borderWidth: 0
               }
           },
           series: [{
               name: 'Count',
               data: array
           }]
       });
});

$(document).ready(function () {
   var v = $("#xDiv").data('stuff');
   var u = $("#yDiv").data('stuff');
   var k = $("#kDiv").data('stuff');   
    // Common theme for line and pie chart
    // Load the fonts
    Highcharts.createElement('link', {
      href: '//fonts.googleapis.com/css?family=Signika:400,700',
      rel: 'stylesheet',
      type: 'text/css'
    }, null, document.getElementsByTagName('head')[0]);

    // Add the background image to the container
    Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function (proceed) {
      proceed.call(this);
      this.container.style.background = 'url(http://www.highcharts.com/samples/graphics/sand.png)';
    }); 
 
    Highcharts.theme = {
      colors: ["#f45b5b", "#8085e9", "#8d4654", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
         "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
      chart: {
         backgroundColor: null,
         style: {
            fontFamily: "Signika, serif"
         }
      },
      title: {
         style: {
            color: 'black',
            fontSize: '25px',
            fontWeight: 'bold'
         }
      },
     
      tooltip: {
         borderWidth: 0,
         style:{
                fontSize:  '15px'
               },
      },
      legend: {
         itemStyle: {
            fontWeight: 'bold',
            fontSize: '13px'
         }
      },
      xAxis: {
         labels: {
            style: {
               color: '#6e6e70'
            }
         }
      },
      yAxis: {
         labels: {
            style: {
               color: '#6e6e70'
            }
         }
      },
      plotOptions: {
         series: {
            shadow: true
         },
         candlestick: {
            lineColor: '#404048'
         },
         map: {
            shadow: false
         }
      },
    // General
      background2: '#E0E0E8' 
    };

//***************Line chart code
// Apply the theme
Highcharts.setOptions(Highcharts.theme);
$('#linechart').highcharts({
       chart: {
        spacingBottom: 55,
           spacingTop: 40,
           spacingLeft: 40,
           spacingRight: 40
        },
        credits: {
           enabled: false
       },
       title: {
           text: 'Tickets Count vs Date',
           style:{
            fontSize:  '27px'
           },            
            },
        xAxis: {
        categories: u,
        labels: {
               rotation: 50,
               style: {
               fontSize: '13px',
              }
            }
       },
       yAxis: {
           title: {
               text: 'Tickets Count',
               style: {
               fontSize: '15px',
              }
        },
        plotLines: [{
               value: 10,
        }]
       },
       tooltip: {
           
       },
       legend: {
           layout: 'horizontal',
           align: 'right',
           verticalAlign: 'middle',
           borderWidth: 0,
           borderRadius: 5 ,
           borderWidth: 1,
       },
       series: [{
           name: 'New Tickets',
           data: v
        }]
   });
   
   
//******PIE-CHART code
$('#container').highcharts({
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: 'Ticket Status by Percentage'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    credits: {
      enabled: false
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
            style: {
              color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                    fontSize: '15px'
            }
        }
      }
    },
    series: [{
      name: "Tickets",
      colorByPoint: true,
      style: {
        fontSize: '13px',
      },
      data: [{
        name: "Complete",
        y: k[0],
        style: {
          fontSize: '13px',
        },
      }, 
      {  
        name: "Processing",
        y: k[1],
        sliced: true,
        selected: true,
        style: {
          fontSize: '13px',
        },
      },
      {
        name: "New",
        y: k[2],
        style: {
          fontSize: '13px',
        },
      }]
    }]
  });
});
