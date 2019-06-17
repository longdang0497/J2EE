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
                            <h5 class="card-title">MANAGE CUSTOMER</h5>
                        </div>
                        <c:set var = "maPQ" scope = "session" value = "${authorityObject.getAuthority().getMaPQ()}"/>
                        <c:set var = "maNV" scope = "session" value = "${authorityObject.getEmployee().getMaNV()}"/>
                        <form class="card-body" method="post" onsubmit="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/store&save'); window.history.go();">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maKhu" class="form-control"/>
                                        <label class="segment-lb">Name</label>
                                        <input type="text" name="tenKhu" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round" onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/store'); window.history.go();" />
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round"
                                   onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/store'); window.history.go();"/>
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
                                            <c:forEach var="list" items="${storeLists}">
                                                <tr>
                                                    <td>${list.maKhu}</td>
                                                    <td>${list.tenKhu}</td>
                                                    <td>
                                                        <a id="btn-delete" onclick="if (confirm('Do you want to delete this?')) window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/store/delete/${list.maKhu}'); window.history.go();">Delete</a>
                                                        <a onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/viewStore/${list.maKhu}'); window.history.go();">Edit</a>
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
            $('#nav_store').addClass('active');
        });
    </script>
</div>
</body>
</html>