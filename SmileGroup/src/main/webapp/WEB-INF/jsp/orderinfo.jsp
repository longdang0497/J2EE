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
                            <h5 class="card-title">ORDER INFORMATIONS</h5>
                        </div>
                        <form name="biForm" class="card-body" method="post" action="/order-info&save/${maDDH}">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maCTDDH" class="form-control"/>
                                        <label class="segment-lb">Order ID</label>
                                        <input name="maDDH" type="number" required="" value="${maDDH}" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Product</label>
                                        <select name="tenMH" class="form-control">
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
                                        <input id="orQuantities" type="number" name="soLuong" value="0" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" class="btn btn-primary btn-round" value="SAVE"/>
                            <input type="button" class="btn btn-primary btn-round" value="REFRESH" onclick="window.location.href='/order/details/${maDDH}'"/>
                            <a class="btn btn-primary btn-round" href="/order">BACK</a>
                        </form></div>
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