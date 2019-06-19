<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Product Report Info List</title>
  <%@include file="fragment/importLibs.jsp" %>
</head>

<body>
  <div class="wrapper ">
    <!-- Sidebar (hidden by default) -->
    <%@include file="fragment/sidebar.jsp"%>
    <div class="main-panel">
      <!-- Top menu -->
      <%@include file="fragment/header.jsp"%>

      <!-- PAGE CONTENT -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">MANAGE PRODUCT REPORTS INFORMATION</h5>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
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
                  <a href="/productReport/" class="btn btn-primary btn-round">BACK</a>
                </div>
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
            </div>
          </div>
        </div>

      </div>
    </div>
    <!-- Footer -->
    <%@include file="fragment/footer.jsp"%>
  </div>

  <!-- JS -->
  <%@include file="fragment/importJS.jsp"%>

  <!-- End page content -->

  </div>


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
</body>

</html>