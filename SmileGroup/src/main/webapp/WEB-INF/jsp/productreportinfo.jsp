<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Report Info List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE PRODUCT REPORTS INFORMATION</h1>
    </div>

    <div>
        <a href="/productReport/">BACK</a>
    </div>
    <div>
        <div>
            <table class="fl-table">
                <thead>
                <tr>
                    <th>PR ID </th>
                    <th>Product</th>
                    <th>Import</th>
                    <th>Export/Sell</th>
                    <th>Left</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="prList" items="${prInfoLists}">
                    <tr>
                        <td>${prList.productReport.maBCHT}</td>
                        <td>${prList.product.tenMH}</td>
                        <td>${prList.luongNhap}</td>
                        <td>${prList.luongBan}</td>
                        <td>${prList.luongTon}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>