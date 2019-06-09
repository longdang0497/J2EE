<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Import Product List</title>
    <%@include file="fragment/importLibs.jsp" %>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<%@include file="fragment/sidebar.jsp" %>

<!-- Top menu -->
<%@include file="fragment/header.jsp" %>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">
    <h2>
        <c:if test="${not empty errorMessage}">
            <c:out value="${errorMessage}"/>
        </c:if>
    </h2>
    <div class="w3-white w3-xlarge">
        <h1 class="w3-left" style="width: 100%;">MANAGE IMPORT PRODUCT</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/importProduct&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maPN" class="segment-tb"/>
                        <label class="segment-lb">Order ID</label>
                        <select name="maDDH" class="segment-tb">
                            <option>Choose an order ID</option>
                            <c:forEach var="oList" items="${orderLists}">
                                <option>${oList.maDDH}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <label class="segment-lb">Employee</label>
                        <select name="tenNV" class="segment-tb">
                            <option>Choose an employee</option>
                            <c:forEach var="eList" items="${employeeLists}">
                                <option>${eList.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Published Date (yyyy-mm-dd)</label>
                        <input type="text" name="ngayLapPhieu" required="" class="segment-tb" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/importProduct'"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div>
        <table class="fl-table">
            <thead>
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

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>