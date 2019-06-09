<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE PRODUCTS</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/product&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maMH" class="segment-tb"/>
                        <label class="segment-lb">Name</label>
                        <input type="text" name="tenMH" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Unit</label>
                        <select name="tenDV" class="segment-tb">
                            <option>Choose a unit</option>
                            <c:forEach var="uList" items="${unitLists}">
                                <option>${uList.tenDV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Manufacturer</label>
                        <input type="text" name="hangSX" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Type</label>
                        <select name="tenLoai" class="segment-tb">
                            <option>Choose a type</option>
                            <c:forEach var="tList" items="${tocLists}">
                                <option>${tList.tenLoai}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Description</label>
                        <input type="text" name="cauHinh" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Store</label>
                        <select name="tenKhu" class="segment-tb" value="">
                            <option>Choose a store</option>
                            <c:forEach var="sList" items="${storeLists}">
                                <option>${sList.tenKhu}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="maMH" class="segment-tb"/>
                        <label class="segment-lb">Quantities</label>
                        <input type="text" name="soLuong" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/product'"/>
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
                <th>Name</th>
                <th>Manufacturer</th>
                <th>Unit</th>
                <th>Description</th>
                <th>Type</th>
                <th>Store</th>
                <th>Quantities</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${productLists}">
                <tr>
                    <td>${list.maMH}</td>
                    <td>${list.tenMH}</td>
                    <td>${list.hangSX}</td>
                    <td>${list.unit.tenDV}</td>
                    <td>${list.cauHinh}</td>
                    <td>${list.type.tenLoai}</td>
                    <td>${list.store.tenKhu}</td>
                    <td>${list.soLuong}</td>
                    <td>
                        <a href="/product/delete/${list.maMH}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                        <a href="/viewProduct/${list.maMH}">Edit</a>
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