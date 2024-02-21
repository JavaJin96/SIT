<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function shopWrite(){
	location.href = '<c:out value="pshopWrite.do"/>';
}
		
</script>
	<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Responsive.js"></script>  
<style>

#chartdiv {
  width: 100%;
  height: 500px;
}

.btn-info {
 	float: left;
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
//         wheelX: "panX", // 마우스 휠 확대 및 축소 효과
//         wheelY: "zoomX", // 마우스 휠 확대 및 축소 효과
        pinchZoomX: true,
//         paddingLeft:0,
//         paddingRight:1
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
        categoryField: "sellDate",
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
        valueYField: "totalPrice",
        sequencedInterpolation: true,
        categoryXField: "sellDate",
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
//     var data =[{"totalPrice":105900,"sellDate":"2024-02-17"},{"totalPrice":631800,"sellDate":"2024-02-18"},{"totalPrice":1256400,"sellDate":"2024-02-19"}];
	var data = ${gsonData};

    xAxis.data.setAll(data);
    yAxis.data.setAll(data); // Y축에 데이터 설정
    series.data.setAll(data);


// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
    series.appear(1000);
    chart.appear(1000, 100);

}); // end am5.ready()
</script>

</head>
<body>

<div class="container">
  <h2> <a href = "pshopSellList.do" style="color: inherit; text-decoration: none;" >판매내역</a> </h2>
 <div id="chartdiv">
 </div>
<%-- 	<c:forEach var="dataPoint" items="${data}"> --%>
<%--     	<p>Date: ${dataPoint.sellDate}, Total Price: ${dataPoint.totalPrice}</p> --%>
<%-- 	</c:forEach> --%>
</div>


</body>
</html>