<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Order Information</title>
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
        <form class="segment" method="post" action="/order-info&edit/${orderInfoList.order.maDDH}">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="number" name="maCTDDH" required="" class="segment-tb" value="${orderInfoList.maCTDDH}"></td>
                </tr>
                <tr>
                    <th>Bill ID</th>
                    <td><input type="number" name="maDDH" required="" class="segment-tb" value="${orderInfoList.order.maDDH}"></td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td>
                        <select name="tenMH" class="segment-tb" >
                            <c:forEach var="item" items="${productLists}">
                                <option value="${item.tenMH}" ${item.maMH == orderInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Quantities</th>
                    <td><input type="number" name="soLuong" required="" class="segment-tb" value="${orderInfoList.soLuong}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/order/details/${orderInfoList.order.maDDH}">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>