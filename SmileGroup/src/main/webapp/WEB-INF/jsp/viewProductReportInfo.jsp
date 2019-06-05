<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Product Report List</title>
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
        <form class="segment" method="post" action="/productReport&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maCTBC" required="" class="segment-tb" value="${productReportInfoList.maCTBC}"></td>
                </tr>
                <tr>
                    <th>Product Report ID</th>
                    <td>
                        <input type="text" name="maBCHT" required="" class="segment-tb" value="${productReportInfoList.productReport.maBCHT}">
                    </td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td>
                        <select name="tenMH" class="segment-tb" >
                            <c:forEach var="item" items="${productLists}">
                                <option value="${item.tenMH}" ${item.maMH == productReportInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Import</th>
                    <td><input type="number" name="luongNhap" required="" class="segment-tb" value="${productReportInfoList.luongNhap}"></td>
                </tr>
                <tr>
                    <th>Export</th>
                    <td><input type="number" name="luongBan" required="" class="segment-tb" value="${productReportInfoList.luongBan}"></td>
                </tr>
                <tr>
                    <th>Left</th>
                    <td><input type="number" name="luongTon" required="" class="segment-tb" value="${productReportInfoList.luongTon}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/productReportInfo/details/${productReportInfoList.productReport.maBCHT}">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>