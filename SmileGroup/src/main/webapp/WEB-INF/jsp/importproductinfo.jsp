<%@ page import="java.util.Optional" %>
<%@ page import="com.smilegroup.componentmanagement.Models.Product" %>
<%@ page import="com.smilegroup.componentmanagement.DAO.ProductRepository" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Import Product Info List</title>
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
                            <h5 class="card-title">MANAGE CUSTOMER</h5>
                        </div>
                        <form name="ipForm" class="card-body" method="post" action="/importProduct-info&save/${maPN}">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maCTPN" class="form-control"/>
                                        <label class="segment-lb">IP ID</label>
                                        <input name="maPN" type="number" required="" value="${maPN}" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Product</label>
                                        <select name="tenMH" class="form-control">
                                            <option>Choose a product</option>
                                            <c:forEach var="pList" items="${productLists}">
                                                <option>${pList.product.tenMH}</option>
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
                                        <input id="biPrice" type="number" name="donGiaBan" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Listed price</label>
                                        <input id="biTotal" type="number" value="" name="donGia" class="form-control" onclick="calculate()"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="segment-lb">Quantities</label>
                                        <input id="ipQuantities" type="number" name="soLuong" value="0" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Note</label>
                                        <input type="text" name="ghiChu" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" class="btn btn-primary btn-round" value="SAVE"/>
                            <input type="button" class="btn btn-primary btn-round" value="REFRESH" onclick="window.location.href='/importProduct/details/${maPN}'"/>
                            <a class="btn btn-primary btn-round" href="/importProduct/">BACK</a>
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
                                        <th>Import Product ID</th>
                                        <th>Product</th>
                                        <th>Listed price</th>
                                        <th>Selling price</th>
                                        <th>Quantities</th>
                                        <th>Total</th>
                                        <th>Note</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${importProductInfoList}">
                                        <tr>
                                            <td>${list.maCTPN}</td>
                                            <td>${list.importProduct.maPN}</td>
                                            <td>${list.product.tenMH}</td>
                                            <td>${list.donGia}</td>
                                            <td>${list.donGiaBan}</td>
                                            <td>${list.soLuong}</td>
                                            <td>${list.tongTien}</td>
                                            <td>${list.ghiChu}</td>
                                            <td>
                                                <a href="/importProduct/details/${list.importProduct.maPN}/delete/${list.maCTPN}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                                <a href="/viewImportProductInfo/${list.maCTPN}">Edit</a>
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
        $('#nav_importProduct').addClass('active');
    });
</script>
</div>
</body>
</html>