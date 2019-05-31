<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Import Product Information</title>
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
        <form class="segment" method="post" action="/importProduct-info&edit/${importProductInfoList.importProduct.maPN}">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="number" name="maCTPN" required="" class="segment-tb" value="${importProductInfoList.maCTPN}"></td>
                </tr>
                <tr>
                    <th>IP ID</th>
                    <td><input type="number" name="maPN" required="" class="segment-tb" value="${importProductInfoList.importProduct.maPN}"></td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td>
                        <select name="tenMH" class="segment-tb" >
                            <c:forEach var="item" items="${productLists}">
                                <option value="${item.tenMH}" ${item.maMH == importProductInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Listed Price</th>
                    <td><input type="number" name="donGiaBan" required="" class="segment-tb" value="${importProductInfoList.donGiaBan}"></td>
                </tr>
                <tr>
                    <th>Selling Price</th>
                    <td><input type="number" name="donGia" required="" class="segment-tb" value="${importProductInfoList.donGia}"></td>
                </tr>
                <tr>
                    <th>Quantities</th>
                    <td><input type="number" name="soLuong" required="" class="segment-tb" value="${importProductInfoList.soLuong}"></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td><input type="number" name="tongTien" required="" class="segment-tb" value="${importProductInfoList.tongTien}"></td>
                </tr>
                <tr>
                    <th>Note</th>
                    <td><input type="text" name="ghiChu" required="" class="segment-tb" value="${importProductInfoList.ghiChu}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/importProduct/details/${importProductInfoList.importProduct.maPN}">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>