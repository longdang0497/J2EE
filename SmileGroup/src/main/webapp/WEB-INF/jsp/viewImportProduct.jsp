<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Import Product List</title>
    <%@include file="fragment/importLibs.jsp"%>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<%@include file="fragment/sidebar.jsp"%>

<!-- Top menu -->
<%@include file="fragment/header.jsp"%>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">

    <div>
        <form class="segment" method="post" action="/importProduct&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maPN" required="" class="segment-tb" value="${importProductEditList.maPN}"></td>
                </tr>
                <tr>
                    <th>Order ID</th>
                    <td>
                        <select name="maDDH" class="segment-tb" >
                            <c:forEach var="item" items="${orderLists}">
                                <option value="${item.maDDH}" ${item.maDDH == importProductEditList.order.maDDH ? 'selected="selected"' : ''}>${item.maDDH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Employee</th>
                    <td>
                        <select name="tenNV" class="segment-tb" >
                            <c:forEach var="item" items="${empLists}">
                                <option value="${item.tenNV}" ${item.maNV == importProductEditList.employee.maNV ? 'selected="selected"' : ''}>${item.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Published Date</th>
                    <td><input type="text" name="ngayLapPhieu" required="" class="segment-tb" value="${importProductEditList.ngayLapPhieu}"></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td><input type="number" name="tongTienPN" required="" class="segment-tb" value="${importProductEditList.tongTienPN}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/importProduct">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>