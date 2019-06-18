<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Customer List</title>
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
                <h5 class="card-title">MANAGE CUSTOMER</h5>
              </div>
<%--              <c:set var = "maPQ" scope = "session" value = "${authorityObject.getAuthority().getMaPQ()}"/>--%>
<%--              <c:set var = "maNV" scope = "session" value = "${authorityObject.getEmployee().getMaNV()}"/>--%>
              <form class="card-body" method="post" action="/customer&save">
                <table>
                  <tr>
                    <td>
                      <input type="hidden" name="maKH" class="segment-tb" />
                      <label class="segment-lb">Name</label>
                      <input type="text" name="tenKH" required="" class="form-control" />
                    </td>
                    <td>
                      <label class="segment-lb">Address</label>
                      <input type="text" name="diaChi" required="" class="form-control" />
                    </td>
                  </tr>
                  <tr>

                    <td class="form-list__row">
                      <label class="segment-lb">Phone</label>
                      <input type="number" name="soDT" required="" class="form-control" />
                    </td>
                    <td>
                      <label class="segment-lb">Email</label>
                      <input type="email" name="email" required="" class="form-control" />
                    </td>
                  </tr>
                </table>
                <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/customer'"/>
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
                    <thead class=" text-primary">
                      <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="list" items="${customerLists}">
                        <tr>
                          <td>${list.maKH}</td>
                          <td>${list.tenKH}</td>
                          <td>${list.diaChi}</td>
                          <td>${list.email}</td>
                          <td>${list.soDT}</td>
                          <td>
                            <a href="/customer/delete/${list.maKH}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                            <a href="/viewCustomer/${list.maKH}">Edit</a>
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
      $('#nav_customer').addClass('active');
    });
  </script>
  </div>
</body>

</html>