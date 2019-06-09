<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Provider List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE PROVIDERS</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/provider&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maNCC" class="segment-tb"/>
                        <label class="segment-lb">Name</label>
                        <input type="text" name="tenNCC" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Address</label>
                        <input type="text" name="diaChiNCC" required="" class="segment-tb"/>
                    </td>
                </tr>
                <tr>

                    <td class="form-list__row">
                        <label class="segment-lb">Phone</label>
                        <input type="text" name="soDTNCC" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Email</label>
                        <input type="text" name="emailNCC" required="" class="segment-tb"/>
                    </td>
                </tr>
            </table>
            <input type="submit" value="SAVE"/>
            <input type="button" value="REFRESH" onclick="window.location.href='/provider'"/>
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
            <c:forEach var="list" items="${providerLists}">
                <tr>
                    <td>${list.maNCC}</td>
                    <td>${list.tenNCC}</td>
                    <td>${list.diaChiNCC}</td>
                    <td>${list.emailNCC}</td>
                    <td>${list.soDTNCC}</td>
                    <td>
                        <a href="/provider/delete/${list.maNCC}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                        <a href="/viewProvider/${list.maNCC}">Edit</a>
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