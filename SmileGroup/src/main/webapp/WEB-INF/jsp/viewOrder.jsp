<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Order List</title>
    <%@include file="fragment/importLibs.jsp"%>
</head>
<body>
<div class="wrapper ">
    <!-- Sidebar (hidden by default) -->
    <%@include file="fragment/sidebar.jsp"%>

    <div class="main-panel">
        <!-- Top menu -->
        <%@include file="fragment/header.jsp"%>

        <!-- PAGE CONTENT -->
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div>
        <form class="segment" method="post" action="/order&edit">
            <table class="table">
                <thead class=" text-primary">
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maDDH" readonly required="" class="form-control" value="${orderEditList.maDDH}"></td>
                </tr>
                <tr>
                    <th>Employee</th>
                    <td>
                        <select name="tenNV" class="form-control" >
                            <c:forEach var="item" items="${empLists}">
                                <option value="${item.tenNV}" ${item.maNV == orderEditList.employee.maNV ? 'selected="selected"' : ''}>${item.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Published Date</th>
                    <td><input type="text" name="ngayLap" required="" class="form-control" value="${orderEditList.ngayLap}"></td>
                </tr>
                <tr>
                    <th>Provider</th>
                    <td>
                        <select name="tenNCC" class="form-control" >
                            <c:forEach var="item" items="${providerLists}">
                                <option value="${item.tenNCC}" ${item.maNCC == orderEditList.provider.maNCC ? 'selected="selected"' : ''}>${item.tenNCC}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <thead>
            </table>
            <input type="submit" class="btn btn-primary btn-round" value="SAVE" />
            <a class="btn btn-primary btn-round" href="/order">BACK</a>
        </form>

    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>