<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Employee List</title>
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
            <h5 class="card-title">MANAGE EMPLOYEES</h5>
          </div>
          <form class="card-body" method="post" action="/employee&save">
            <table>
              <tr>
                <td>
                  <input type="hidden" name="maNV" class="segment-tb" />
                  <label class="segment-lb">Name</label>
                  <input type="text" name="tenNV" required="" class="form-control" />
                </td>
                <td>
                  <label class="segment-lb">Department</label>
                  <select name="tenPhong" class="form-control">
                    <option>Choose a department</option>
                    <c:forEach var="list" items="${depLists}">
                      <option>${list.tenPhong}</option>
                    </c:forEach>
                  </select>
                </td>
                <td>
                  <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                  <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/employee'" />
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
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="list" items="${employeeLists}">
                    <tr>
                      <td>${list.maNV}</td>
                      <td>${list.tenNV}</td>
                      <td>${list.department.tenPhong}</td>
                      <td>
                        <a href="/employee/delete/${list.maNV}"
                          onclick="return confirm('Do you want to delete this?')">Delete</a>
                        <a href="/viewEmployee/${list.maNV}">Edit</a>
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
  $('#nav_employee').addClass('active');
});
</script>
</div>
</body>

</html>