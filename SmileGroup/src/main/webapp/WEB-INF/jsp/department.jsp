<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Department List</title>
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
                            <h5 class="card-title">MANAGE DEPARTMENTS</h5>
                        </div>
                        <form class="card-body" method="post" action="/department&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maPhong" class="form-control"/>
                                        <label class="segment-lb">Name</label>
                                        <input type="text" name="tenPhong" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/department'"/>
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
                                <c:forEach var="list" items="${depLists}">
                                    <tr>
                                        <td>${list.maPhong}</td>
                                        <td>${list.tenPhong}</td>
                                        <td>
                                            <a href="/department/delete/${list.maPhong}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                            <a href="/viewDepartment/${list.maPhong}">Edit</a>
                                        </td>
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
        $('#nav_department').addClass('active');
    });
</script>
</div>
</body>
</html>