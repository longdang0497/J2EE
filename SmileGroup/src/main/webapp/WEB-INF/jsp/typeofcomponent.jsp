<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Type Of Component List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE TYPE OF COMPONENT</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/typeofcomponent&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maLoai" class="segment-tb"/>
                        <label class="segment-lb">Name</label>
                        <input type="text" name="tenLoai" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/typeofcomponent'"/>
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
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${tocLists}">
                <tr>
                    <td>${list.maLoai}</td>
                    <td>${list.tenLoai}</td>
                    <td>
                        <a href="/typeofcomponent/delete/${list.maLoai}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                        <a href="/viewTypeOfComponent/${list.maLoai}">Edit</a>
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