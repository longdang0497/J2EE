<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer List</title>
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
            <h1 class="w3-left" style="width: 100%;">MANAGE CUSTOMER</h1>
        </div>

        <div>
            <form class="segment" method="post" action="/customer&save">
                <table>
                    <tr>
                        <td>
                            <input type="hidden" name="maKH" class="segment-tb"/>
                            <label class="segment-lb">Name</label>
                            <input type="text" name="tenKH" required="" class="segment-tb"/>
                        </td>
                        <td>
                            <label class="segment-lb">Address</label>
                            <input type="text" name="diaChi" required="" class="segment-tb"/>
                        </td>
                    </tr>
                    <tr>

                        <td class="form-list__row">
                            <label class="segment-lb">Phone</label>
                            <input type="text" name="soDT" required="" class="segment-tb"/>
                        </td>
                        <td>
                            <label class="segment-lb">Email</label>
                            <input type="text" name="email" required="" class="segment-tb"/>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="SAVE"/>
                <input type="button" value="REFRESH" onclick="window.location.href='/customer'"/>
            </form>
        </div>
        <div>
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${customerLists}">
                    <tr>
                        <td>${list.maKH}</td>
                        <td>${list.tenKH}</td>
                        <td>${list.diaChi}</td>
                        <td>${list.email}</td>
                        <td>${list.soDT}</td>
                        <td>
                            <a href="/customer/delete/${list.maKH}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                            <a href="/viewCustomer/${list.maKH}">Edit</a>
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