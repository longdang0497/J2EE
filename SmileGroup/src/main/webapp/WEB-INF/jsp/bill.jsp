<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE BILLS</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/bill&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maHD" class="segment-tb"/>
                        <label class="segment-lb">Customer Name</label>
                        <select name="tenKH" class="segment-tb">
                            <option>Choose a customer</option>
                            <c:forEach var="cList" items="${customerLists}">
                                <option>${cList.tenKH}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <label class="segment-lb">Tax Code</label>
                        <input type="text" name="maSoThue" required="" class="segment-tb"/>
                    </td>
                </tr>
                <tr>
                    <td>
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
                    <td colspan="2">
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/bill'"/>
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

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>