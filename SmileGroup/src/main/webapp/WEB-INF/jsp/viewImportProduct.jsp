<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Import Product List</title>
    <%@include file="fragment/importLibs.jsp"%>
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
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div>
        <form class="segment" method="post" action="/importProduct&edit">
            <table class="table">
                <thead class=" text-primary">
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maPN" readonly required="" class="form-control" value="${importProductEditList.maPN}"></td>
                </tr>
                <tr>
                    <th>Order ID</th>
                    <td>
                        <select name="maDDH" class="form-control" >
                            <c:forEach var="item" items="${orderLists}">
                                <option value="${item.maDDH}" ${item.maDDH == importProductEditList.order.maDDH ? 'selected="selected"' : ''}>${item.maDDH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Employee</th>
                    <td>
                        <select name="tenNV" class="form-control" >
                            <c:forEach var="item" items="${empLists}">
                                <option value="${item.tenNV}" ${item.maNV == importProductEditList.employee.maNV ? 'selected="selected"' : ''}>${item.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Published Date</th>
                    <td><input type="text" name="ngayLapPhieu" required="" class="form-control" value="${importProductEditList.ngayLapPhieu}"></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td><input type="number" name="tongTienPN" required="" class="form-control" value="${importProductEditList.tongTienPN}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
            <a class="btn btn-primary btn-round" href="/importProduct">BACK</a>
        </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="fragment/footer.jsp"%>

    <!-- JS -->
    <%@include file="fragment/importJS.jsp"%>

    <!-- End page content -->
    <script>
        $(document).ready(function () {
            $('#nav_importProduct').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>