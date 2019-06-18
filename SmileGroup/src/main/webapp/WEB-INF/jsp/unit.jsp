<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Store List</title>
    <%@include file="fragment/importLibs.jsp" %>
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
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">MANAGE UNITS</h5>
                        </div>
<%--                        <c:set var = "maPQ" scope = "session" value = "${authorityObject.getAuthority().getMaPQ()}"/>--%>
<%--                        <c:set var = "maNV" scope = "session" value = "${authorityObject.getEmployee().getMaNV()}"/>--%>
                        <form class="card-body" method="post" action="/unit&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maDV" class="form-control"/>
                                        <label class="segment-lb">Name</label>
                                        <input type="text" name="tenDV" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <input type="submit" class="btn btn-primary btn-round" value="SAVE"/>
                                        <input type="button" class="btn btn-primary btn-round" value="REFRESH" onclick="window.location.href='/unit'"/>                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class=" text-primary">
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${unitLists}">
                                        <tr>
                                            <td>${list.maDV}</td>
                                            <td>${list.tenDV}</td>
                                            <td>
                                                <a href="/unit/delete/${list.maDV}">Delete</a>
                                                <a href="/viewUnit/${list.maDV}">Edit</a>                                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <%@include file="fragment/footer.jsp"%>
</div>

<!-- JS -->
<%@include file="fragment/importJS.jsp"%>

<!-- End page content -->
<script>
    $(document).ready(function () {
        $('#nav_unit').addClass('active');
    });
</script>
</div>
</body>
</html>