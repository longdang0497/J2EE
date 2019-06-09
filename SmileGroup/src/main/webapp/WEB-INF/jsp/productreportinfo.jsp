<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Report Info List</title>
    <%@include file="fragment/importLibs.jsp" %>
    <script type="text/javascript">
        // Load the Visualization API and the piechart package.
        google.load('visualization', '1.0', {
            'packages' : [ 'corechart' ]
        });
        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(drawChart);
        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.

        function drawChart() {
            // Create the data table.
            var dataLB = google.visualization.arrayToDataTable([
                ['Product', 'Sell'],
                <c:forEach items="${prInfoLists}" var="entry">
                [ '${entry.product.tenMH}', ${entry.luongBan} ],
                </c:forEach>
            ]);

            var dataLN = google.visualization.arrayToDataTable([
                ['Product', 'Import'],
                <c:forEach items="${prInfoLists}" var="entry">
                [ '${entry.product.tenMH}', ${entry.luongNhap} ],
                </c:forEach>
            ]);

            var dataLT = google.visualization.arrayToDataTable([
                ['Product', 'Left'],
                <c:forEach items="${prInfoLists}" var="entry">
                [ '${entry.product.tenMH}', ${entry.luongTon} ],
                </c:forEach>
            ]);

            // Set chart options
            var optionsLB = {
                'title' : 'SỐ LƯỢNG BÁN CỦA CÁC MẶT HÀNG TRONG THÁNG',
                is3D : true,
                pieSliceText: 'label',
                tooltip :  {showColorCode: true},
                'width' : 900,
                'height' : 500
            };

            var optionsLN = {
                'title' : 'SỐ LƯỢNG NHẬP CỦA CÁC MẶT HÀNG TRONG THÁNG',
                is3D : true,
                pieSliceText: 'label',
                tooltip :  {showColorCode: true},
                'width' : 900,
                'height' : 500
            };

            var optionsLT = {
                'title' : 'SỐ LƯỢNG TỒN CỦA CÁC MẶT HÀNG TRONG THÁNG',
                is3D : true,
                pieSliceText: 'label',
                tooltip :  {showColorCode: true},
                'width' : 900,
                'height' : 500
            };

            // Instantiate and draw our chart, passing in some options.
            var chartLB = new google.visualization.PieChart(document.getElementById('chart_div_LB'));
            chartLB.draw(dataLB, optionsLB);

            var chartLN = new google.visualization.PieChart(document.getElementById('chart_div_LN'));
            chartLN.draw(dataLN, optionsLN);

            var chartLT = new google.visualization.PieChart(document.getElementById('chart_div_LT'));
            chartLT.draw(dataLT, optionsLT);
        }
    </script>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<%@include file="fragment/sidebar.jsp" %>

<!-- Top menu -->
<%@include file="fragment/header.jsp" %>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">
    <div class="w3-white w3-xlarge">
        <h1 class="w3-left" style="width: 100%;">MANAGE PRODUCT REPORTS INFORMATION</h1>
    </div>

    <div>
        <a href="/productReport">BACK</a>
    </div>
    <div>
        <div>
            <table class="fl-table">
                <thead>
                <tr>
                    <th>PR ID </th>
                    <th>Product</th>
                    <th>Import</th>
                    <th>Export/Sell</th>
                    <th>Left</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="prList" items="${prInfoLists}">
                    <tr>
                        <td>${prList.productReport.maBCHT}</td>
                        <td>${prList.product.tenMH}</td>
                        <td>${prList.luongNhap}</td>
                        <td>${prList.luongBan}</td>
                        <td>${prList.luongTon}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <br/>
    <br/>
    <div style="width: 600px;">
        <div id="chart_div_LB"></div>
    </div>

    <div style="width: 600px;">
        <div id="chart_div_LN"></div>
    </div>

    <div style="width: 600px;">
        <div id="chart_div_LT"></div>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>