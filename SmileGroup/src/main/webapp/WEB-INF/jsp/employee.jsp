<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employee List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE EMPLOYEES</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/employee&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maNV" class="segment-tb"/>
                        <label class="segment-lb">Name</label>
                        <input type="text" name="tenNV" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Department</label>
                        <select name="tenPhong" class="segment-tb">
                            <option>Choose a department</option>
                            <c:forEach var="list" items="${depLists}">
                                <option>${list.tenPhong}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/employee'"/>
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
                <th>Department</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${employeeLists}">
                <tr>
                    <td>${list.maNV}</td>
                    <td>${list.tenNV}</td>
                    <td>${list.department.tenPhong}</td>
                    <td>
                        <a href="/employee/delete/${list.maNV}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                        <a href="/viewEmployee/${list.maNV}">Edit</a>
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