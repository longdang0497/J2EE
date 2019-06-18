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
</body>

</html>