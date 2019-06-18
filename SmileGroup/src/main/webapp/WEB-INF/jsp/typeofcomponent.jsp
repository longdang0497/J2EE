<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Type Of Component List</title>
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
                            <h5 class="card-title">MANAGE TYPES OF COMPONENTS</h5>
                        </div>
                        <form class="card-body" method="post" action="/typeofcomponent&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maLoai" class="form-control"/>
                                        <label class="segment-lb">Name</label>
                                        <input type="text" name="tenLoai" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/typeofcomponent'"/>
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
        $('#nav_typeofcomponent').addClass('active');
    });
</script>
</div>
</body>
</html>