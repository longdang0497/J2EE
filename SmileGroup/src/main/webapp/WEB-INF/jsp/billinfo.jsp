<%@ page import="java.util.Optional" %>
<%@ page import="com.smilegroup.componentmanagement.Models.Product" %>
<%@ page import="com.smilegroup.componentmanagement.DAO.ProductRepository" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill Info List</title>
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
                            <h5 class="card-title">BILLS INFORMATION</h5>
                        </div>
                        <form name="biForm" class="card-body" method="post" action="/bill-info&save/${maHD}">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maCTHD" class="form-control"/>
                                        <label class="segment-lb">Bill ID</label>
                                        <input name="maHD" type="number" required="" value="${maHD}" class="form-control"/>
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
                                        <label class="segment-lb">Selling price</label>
                <%--                        <select name="tenNV" class="form-control" >--%>
                <%--                            <c:forEach var="item" items="${productLists}">--%>
                <%--                                <option value="${item.donGia}" ${item.tenMH == request.getParameter("tenKH") ? 'selected="selected"' : ''}>${item.donGia}</option>--%>
                <%--                            </c:forEach>--%>
                <%--                        </select>--%>
                                        <input id="biPrice" type="number" name="donGia" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Quantities</label>
                                        <input id="biQuantities" type="number" name="soLuong" value="0" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/bill/details/${maHD}'"/>
                            <a href="/bill/" class="btn btn-primary btn-round">BACK</a>
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
                                        <th>Bill ID</th>
                                        <th>Product</th>
                                        <th>Selling price</th>
                                        <th>Quantities</th>
                                        <th>Total</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${billInfoList}">
                                        <tr>
                                            <td>${list.maCTHD}</td>
                                            <td>${list.bill.maHD}</td>
                                            <td>${list.product.tenMH}</td>
                                            <td>${list.donGia}</td>
                                            <td>${list.soLuong}</td>
                                            <td>${list.tienThanhToan}</td>
                                            <td>
                                                <a href="/bill/details/${list.bill.maHD}/delete/${list.maCTHD}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                                <a href="/viewBillInfo/${list.maCTHD}">Edit</a>
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
        $('#nav_bill').addClass('active');
    });
</script>
</div>
</body>
</html>