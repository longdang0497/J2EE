<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Import Product List</title>
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
                            <h5 class="card-title">MANAGE IMPORT PRODUCT</h5>
                        </div>
                        <form class="card-body" method="post" action="/importProduct&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maPN" class="form-control"/>
                                        <label class="segment-lb">Order ID</label>
                                        <select name="maDDH" class="form-control">
                                            <option>Choose an order ID</option>
                                            <c:forEach var="oList" items="${orderLists}">
                                                <option>${oList.maDDH}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <label>Employee</label>
                                        <select name="tenNV" class="form-control">
                                            <option>Choose an employee</option>
                                            <c:forEach var="eList" items="${employeeLists}">
                                                <option>${eList.tenNV}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Published Date (yyyy-mm-dd)</label>
                                        <input type="text" name="ngayLapPhieu" required="" class="form-control" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/importProduct'"/>
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
                                        <th>Order ID</th>
                                        <th>Employee</th>
                                        <th>Published Date</th>
                                        <th>Total</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${importProductLists}">
                                        <tr>
                                            <td>${list.maPN}</td>
                                            <td>${list.order.maDDH}</td>
                                            <td>${list.employee.tenNV}</td>
                                            <td>${list.ngayLapPhieu}</td>
                                            <td>${list.tongTienPN}</td>
                                            <td>
                                                <a href="/importProduct/details/${list.maPN}">Info</a>
                                                <a href="/importProduct/delete/${list.maPN}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                                <a href="/viewImportProduct/${list.maPN}">Edit</a>
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
        $('#nav_importProduct').addClass('active');
    });
</script>
</div>
</body>
</html>