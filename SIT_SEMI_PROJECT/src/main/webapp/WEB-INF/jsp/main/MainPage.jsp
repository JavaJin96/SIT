<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>

<style>
	#main_Div{
		font-size:1.4em;
		width: 100%;
		height: 1500px;
		padding-top: 25px;
	}
	#leftTopDiv{
		display:inline-block;
		width:70%;
		height:750px;
		margin-bottom: 30px;
	}
	#leftDownDiv{
		display:inline-block;
		width:70%;
		height:750px;
	}
	#rightDiv{
		display:inline-block;
		width:29.5%;
		float:right;
		height:1500px;
	}
	#loginBox,#boadrDiv{
		width:100%;
		height:400px;
		text-align: center;
	}
	#loginForm{
		width:100%;
	}
	.loginIpb{
		display: inline-block;
		width: 150px;
	}
	#loginForm input[type=button],#loginForm input[type=submit]{
		margin-top: 30px;
	}
	#newBdBtn{
		float:right;
		margin-bottom: 10px;
	}
	#leftIf{
		width:100%;
		height:750px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
		overflow: hidden;
	}
	#loginBox{
		padding-top : 40px;
		height:300px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
		margin-bottom: 20px;
	}
	#loginBox input[type=text], #loginBox input[type=password]{
		width:200px;
		display: inline-block;
	}
	#calendar{
		height:390px;
		font-size: 0.4em;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
	}
	.img{
	    width: 15%;
	    height: 60px;
	    margin-right: 30px;
        margin-left: 30px;
	}
	#homePageInfoDiv{
		margin-top : 69px;
		padding-left : 30px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
	}
	#comeCountChartDiv{
		width:100%;
		height:500px;
		font-size: 0.8em;
	}
	#boadrDiv{
		padding-top:30px;
		padding-left:10px;
		padding-right:10px;
		border : 1px solid rgb(224, 224, 235);
		border-radius: 3%;
		height : 558px;
	}
	#boadrDiv th{
		color : white;
		height: 50px;
		font-size: 0.8em;
		font-weight: bold;
	}
    #chartdiv {
        width: 100%;
        height: 500px;
    }
</style>

<script>
    am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
    var root = am5.Root.new("chartdiv");

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
    root.setThemes([
        am5themes_Animated.new(root)
    ]);

// Create chart
// https://www.amcharts.com/docs/v5/charts/xy-chart/
    var chart = root.container.children.push(am5xy.XYChart.new(root, {
        panX: true,
        panY: true,
        wheelX: "panX",
        wheelY: "zoomX",
        pinchZoomX: true,
        paddingLeft:0,
        paddingRight:1
    }));

// Add cursor
// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
    cursor.lineY.set("visible", false);


// Create axes
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
    var xRenderer = am5xy.AxisRendererX.new(root, {
        minGridDistance: 30,
        minorGridEnabled: true
    });

    xRenderer.labels.template.setAll({
        rotation: -90,
        centerY: am5.p50,
        centerX: am5.p100,
        paddingRight: 15
    });

    xRenderer.grid.template.setAll({
        location: 1
    })

    var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
        maxDeviation: 0.3,
        categoryField: "country",
        renderer: xRenderer,
        tooltip: am5.Tooltip.new(root, {})
    }));

    var yRenderer = am5xy.AxisRendererY.new(root, {
        strokeOpacity: 0.1
    })

    var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
        maxDeviation: 0.3,
        renderer: yRenderer
    }));

// Create series
// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    var series = chart.series.push(am5xy.ColumnSeries.new(root, {
        name: "Series 1",
        xAxis: xAxis,
        yAxis: yAxis,
        valueYField: "value",
        sequencedInterpolation: true,
        categoryXField: "country",
        tooltip: am5.Tooltip.new(root, {
            labelText: "{valueY}"
        })
    }));

    series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5, strokeOpacity: 0 });
    series.columns.template.adapters.add("fill", function (fill, target) {
        return chart.get("colors").getIndex(series.columns.indexOf(target));
    });

    series.columns.template.adapters.add("stroke", function (stroke, target) {
        return chart.get("colors").getIndex(series.columns.indexOf(target));
    });


// Set data
    var data = [{
        country: "USA",
        value: 2025
    }, {
        country: "China",
        value: 1882
    }, {
        country: "Japan",
        value: 1809
    }, {
        country: "Germany",
        value: 1322
    }, {
        country: "UK",
        value: 1122
    }, {
        country: "France",
        value: 1114
    }, {
        country: "India",
        value: 984
    }, {
        country: "Spain",
        value: 711
    }, {
        country: "Netherlands",
        value: 665
    }, {
        country: "South Korea",
        value: 443
    }, {
        country: "Canada",
        value: 441
    }];

    xAxis.data.setAll(data);
    series.data.setAll(data);


// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
    series.appear(1000);
    chart.appear(1000, 100);

}); // end am5.ready()
</script>

<div id="main_Div">
	<div style="width:100%; height:800px;">
		<iframe src="http://www.sit21c.com" style="width: 100%; height: 800px;" ></iframe>
	</div>
	<h2>일별 접속자</h2>
    <div id="chartdiv"></div>
</div>
