<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Customer List</title>
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
            <form class="segment" method="post" action="/customer&edit">
                <table class="fl-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <td><input type="text" name="maKH" required="" class="segment-tb" value="${customerEditList.maKH}"></td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td><input type="text" name="tenKH" required="" class="segment-tb" value="${customerEditList.tenKH}"></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><input type="text" name="diaChi" required="" class="segment-tb" value="${customerEditList.diaChi}"></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><input type="text" name="email" required="" class="segment-tb" value="${customerEditList.email}"></td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td><input type="text" name="soDT" required="" class="segment-tb" value="${customerEditList.soDT}"></td>
                    </tr>
                    </thead>
                </table>
                <input type="submit" value="SAVE" />
            </form>
            <a href="/customer">BACK</a>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="fragment/footer.jsp"%>

    <!-- End page content -->
</body>
</html>