<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Bill List</title>
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
        <form class="segment" method="post" action="/bill&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maHD" required="" class="segment-tb" value="${billEditList.maHD}"></td>
                </tr>
                <tr>
                    <th>Employee</th>
                    <td>
                        <select name="tenNV" class="segment-tb" >
                            <c:forEach var="item" items="${empLists}">
                                <option value="${item.tenNV}" ${item.maNV == billEditList.employee.maNV ? 'selected="selected"' : ''}>${item.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Published Date</th>
                    <td><input type="text" name="ngayLap" required="" class="segment-tb" value="${billEditList.ngayLap}"></td>
                </tr>
                <tr>
                    <th>Customer</th>
                    <td>
                        <select name="tenKH" class="segment-tb" >
                            <c:forEach var="item" items="${customerLists}">
                                <option value="${item.tenKH}" ${item.maKH == billEditList.customer.maKH ? 'selected="selected"' : ''}>${item.tenKH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Tax Code</th>
                    <td><input type="text" name="maSoThue" required="" class="segment-tb" value="${billEditList.maSoThue}"></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td><input type="number" name="tongTien" required="" class="segment-tb" value="${billEditList.tongTien}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/bill">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>