<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Employee List</title>
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
        <form class="segment" method="post" action="/employee&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maNV" required="" class="segment-tb" value="${employeeEditList.maNV}"></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="tenNV" required="" class="segment-tb" value="${employeeEditList.tenNV}"></td>
                </tr>
                <tr>
                    <th>Department</th>
                    <td>
                        <select name="tenPhong" class="segment-tb" >
                            <c:forEach var="item" items="${depLists}">
                                <option value="${item.tenPhong}" ${item.maPhong == employeeEditList.department.maPhong ? 'selected="selected"' : ''}>${item.tenPhong}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/employee">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>