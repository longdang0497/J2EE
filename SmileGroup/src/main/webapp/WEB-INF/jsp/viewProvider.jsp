<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Provider List</title>
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
        <form class="segment" method="post" action="/provider&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maNCC" required="" class="segment-tb" value="${providerEditList.maNCC}"></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="tenNCC" required="" class="segment-tb" value="${providerEditList.tenNCC}"></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><input type="text" name="diaChiNCC" required="" class="segment-tb" value="${providerEditList.diaChiNCC}"></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input type="text" name="emailNCC" required="" class="segment-tb" value="${providerEditList.emailNCC}"></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><input type="text" name="soDTNCC" required="" class="segment-tb" value="${providerEditList.soDTNCC}"></td>
                </tr>
                </thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/provider">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>