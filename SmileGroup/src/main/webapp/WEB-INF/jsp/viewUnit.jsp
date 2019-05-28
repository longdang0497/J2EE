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
        <form class="segment" method="post" action="/unit&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maDV" required="" class="segment-tb" value="${unitEditList.maDV}"></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="tenDV" required="" class="segment-tb" value="${unitEditList.tenDV}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/unit">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>