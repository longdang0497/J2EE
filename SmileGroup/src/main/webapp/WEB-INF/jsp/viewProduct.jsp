<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Store List</title>
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
        <form class="segment" method="post" action="/store&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maMH" required="" class="segment-tb" value="${productEditList.maMH}"></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="tenMH" required="" class="segment-tb" value="${productEditList.tenMH}"></td>
                </tr>
                <tr>
                    <th>Manufacturer</th>
                    <td><input type="text" name="hangSX" required="" class="segment-tb" value="${productEditList.hangSX}"></td>
                </tr>
                <tr>
                    <th>Unit</th>
                    <td><input type="text" name="tenDV" required="" class="segment-tb" value="${productEditList.unit.tenDV}"></td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td><input type="text" name="cauHinh" required="" class="segment-tb" value="${productEditList.cauHinh}"></td>
                </tr>
                <tr>
                    <th>Type</th>
                    <td><input type="text" name="tenLoai" required="" class="segment-tb" value="${productEditList.type.tenLoai}"></td>
                </tr>
                <tr>
                    <th>Store</th>
                    <td><input type="text" name="tenKhu" required="" class="segment-tb" value="${productEditList.store.tenKhu}"></td>
                </tr>
                <tr>
                    <th>Quantities</th>
                    <td><input type="text" name="soLuong" required="" class="segment-tb" value="${productEditList.soLuong}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/product">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>