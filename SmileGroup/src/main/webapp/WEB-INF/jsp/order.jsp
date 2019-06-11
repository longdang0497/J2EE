<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order List</title>
    <%@include file="fragment/importLibs.jsp" %>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<%@include file="fragment/sidebar.jsp" %>

<!-- Top menu -->
<%@include file="fragment/header.jsp" %>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">
    <div class="w3-white w3-xlarge">
        <h1 class="w3-left" style="width: 100%;">MANAGE ORDERS</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/order&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maDDH" class="segment-tb"/>
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
                        <input type="text" name="ngayLap" required="" class="segment-tb" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Provider Name</label>
                        <select name="tenNCC" class="segment-tb">
                            <option>Choose a customer</option>
                            <c:forEach var="pList" items="${providerLists}">
                                <option>${pList.tenNCC}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/order'"/>
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
        </table>
    </div>


</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>