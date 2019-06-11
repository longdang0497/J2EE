<%@ page import="java.util.Optional" %>
<%@ page import="com.smilegroup.componentmanagement.Models.Product" %>
<%@ page import="com.smilegroup.componentmanagement.DAO.ProductRepository" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Info List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE ORDERS INFORMATION</h1>
    </div>

    <div>
        <a href="/order/">BACK</a>
        <form name="biForm" class="segment" method="post" action="/order-info&save/${maDDH}">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maCTDDH" class="segment-tb"/>
                        <label class="segment-lb">Order ID</label>
                        <input name="maDDH" type="number" required="" value="${maDDH}" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Product</label>
                        <select name="tenMH" class="segment-tb">
                            <option>Choose a product</option>
                            <c:forEach var="pList" items="${productLists}">
                                <option>${pList.tenMH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Quantities</label>
                        <input id="orQuantities" type="number" name="soLuong" value="0" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/order/details/${maDDH}'"/>
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
                <th>Bill ID</th>
                <th>Product</th>
                <th>Quantities</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${orderInfoList}">
                <tr>
                    <td>${list.maCTDDH}</td>
                    <td>${list.order.maDDH}</td>
                    <td>${list.product.tenMH}</td>
                    <td>${list.soLuong}</td>
                    <td>
                        <a href="/order/details/${list.order.maDDH}/delete/${list.maCTDDH}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                        <a href="/viewOrderInfo/${list.maCTDDH}">Edit</a>
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