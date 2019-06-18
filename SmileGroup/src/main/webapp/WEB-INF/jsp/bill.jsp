<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill List</title>
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
                            <h5 class="card-title">MANAGE BILLS</h5>
                        </div>
                        <form class="card-body" method="post" action="/bill&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maHD" class="form-control"/>
                                        <label>Customer Name</label>
                                        <select name="tenKH" class="form-control">
                                            <option>Choose a customer</option>
                                            <c:forEach var="cList" items="${customerLists}">
                                                <option>${cList.tenKH}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Tax Code</label>
                                        <input type="text" name="maSoThue" required="" class="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="segment-lb">Employee</label>
                                        <select name="tenNV" class="form-control">
                                            <option>Choose an employee</option>
                                            <c:forEach var="eList" items="${employeeLists}">
                                                <option>${eList.tenNV}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <label>Published Date (yyyy-mm-dd)</label>
                                        <input type="text" name="ngayLap" required="" class="form-control" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maHD" class="form-control"/>
                                        <label class="segment-lb">Total</label>
                                        <input type="number" name="tongTien" required="" class="form-control""/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/bill'"/>
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
                                        <th>Published Date</th>
                                        <th>Employee</th>
                                        <th>Customer</th>
                                        <th>Tax Code</th>
                                        <th>Total</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${billLists}">
                                        <tr>
                                            <td>${list.maHD}</td>
                                            <td>${list.ngayLap}</td>
                                            <td>${list.employee.tenNV}</td>
                                            <td>${list.customer.tenKH}</td>
                                            <td>${list.maSoThue}</td>
                                            <td>${list.tongTien}</td>
                                            <td>
                                                <a href="/bill/details/${list.maHD}">Info</a>
                                                <a href="/bill/delete/${list.maHD}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                                <a href="/viewBill/${list.maHD}">Edit</a>
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
        $('#nav_bill').addClass('active');
    });
</script>
</div>
</body>
</html>