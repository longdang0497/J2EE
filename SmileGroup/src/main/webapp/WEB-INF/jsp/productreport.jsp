<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Product Report List</title>
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
                <h5 class="card-title">MANAGE PRODUCT REPORTS</h5>
              </div>
              <form class="card-body" method="post" action="/productReport&save">
                <table>
                  <tr>
                    <td>
                      <input type="hidden" name="maBCHT" class="segment-tb" class="form-control" />
                      <label class="segment-lb">Employee</label>
                      <select name="tenNV" class="segment-tb">
                        <option>Choose an employee</option>
                        <c:forEach var="eList" items="${employeeLists}">
                          <option>${eList.tenNV}</option>
                        </c:forEach>
                      </select>
                    </td>
                    <td>
                      <label class="segment-lb">Published Date (yyyy-mm-dd)</label>
                      <input type="text" name="ngayLap" required="" class="segment-tb" required class="form-control"
                        pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" />
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <label class="segment-lb">Month</label>
                      <input type="number" name="thang" required="" class="segment-tb" class="form-control" />
                    </td>
                    <td>
                      <input type="submit" value="SAVE" class="btn btn-primary btn-round" />
                      <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/productReport'" />
                    </td>
                  </tr>
                </table>
              </form>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class="text-primary">
                      <tr>
                        <th>ID</th>
                        <th>Month</th>
                        <th>Published Date</th>
                        <th>Employee</th>
                        <th>Total Import</th>
                        <th>Total Export/Sell</th>
                        <th>Total Left</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="list" items="${productReportLists}">
                        <tr>
                          <td>${list.maBCHT}</td>
                          <td>${list.thang}</td>
                          <td>${list.ngayLap}</td>
                          <td>${list.employee.tenNV}</td>
                          <td>${list.tongNhap}</td>
                          <td>${list.tongBan}</td>
                          <td>${list.tongTon}</td>
                          <td>
                            <a href="/productReportInfo/create/details/${list.maBCHT}/${list.thang}">Info</a>
                            <a href="/productReport/delete/${list.maBCHT}"
                              onclick="return confirm('Do you want to delete this?')">Delete</a>
                          </td>
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
  <script>
    $(document).ready(function () {
      $('#nav_report').addClass('active');
    });
  </script>
  </div>
</body>

</html>