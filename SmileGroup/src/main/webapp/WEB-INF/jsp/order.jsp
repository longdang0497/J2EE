<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order List</title>
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
                            <h5 class="card-title">MANAGE ORDERS</h5>
                        </div>
                        <form class="card-body" method="post" action="/order&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maDDH" />
                                        <label class="segment-lb">Employee</label>
                                        <select name="tenNV" class="form-control">
                                            <option>Choose an employee</option>
                                            <c:forEach var="eList" items="${employeeLists}">
                                                <option>${eList.tenNV}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <label >Published Date (yyyy-mm-dd)</label>
                                        <input type="text" name="ngayLap" required="" class="form-control" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Provider Name</label>
                                        <select name="tenNCC" class="form-control">
                                            <option>Choose a customer</option>
                                            <c:forEach var="pList" items="${providerLists}">
                                                <option>${pList.tenNCC}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/order'"/>
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
                                        <th>Provider</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${orderLists}">
                                        <tr>
                                            <td>${list.maDDH}</td>
                                            <td>${list.ngayLap}</td>
                                            <td>${list.employee.tenNV}</td>
                                            <td>${list.provider.tenNCC}</td>
                                            <td>
                                                <a href="/order/details/${list.maDDH}">Info</a>
                                                <a href="/order/delete/${list.maDDH}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                                <a href="/viewOrder/${list.maDDH}">Edit</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table></div>
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
        $('#nav_order').addClass('active');
    });
</script>
</div>
</body>
</html>