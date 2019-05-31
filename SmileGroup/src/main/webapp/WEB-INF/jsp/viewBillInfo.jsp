<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Bill Information</title>
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
        <form class="segment" method="post" action="/bill-info&edit/${billInfoList.bill.maHD}">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="number" name="maCTHD" required="" class="segment-tb" value="${billInfoList.maCTHD}"></td>
                </tr>
                <tr>
                    <th>Bill ID</th>
                    <td><input type="number" name="maHD" required="" class="segment-tb" value="${billInfoList.bill.maHD}"></td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td>
                        <select name="tenMH" class="segment-tb" >
                            <c:forEach var="item" items="${productLists}">
                                <option value="${item.tenMH}" ${item.maMH == billInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Selling Price</th>
                    <td><input type="number" name="donGia" required="" class="segment-tb" value="${billInfoList.donGia}"></td>
                </tr>
                <tr>
                    <th>Quantities</th>
                    <td><input type="number" name="soLuong" required="" class="segment-tb" value="${billInfoList.soLuong}"></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td><input type="number" name="tienThanhToan" required="" class="segment-tb" value="${billInfoList.tienThanhToan}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/bill/details/${billInfoList.bill.maHD}">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>