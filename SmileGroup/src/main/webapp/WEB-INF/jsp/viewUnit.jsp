<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Store List</title>
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
                                    <form class="segment" method="post" action="/unit&edit">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="text" name="maDV" readonly required="" class="form-control" value="${unitEditList.maDV}"></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><input type="text" name="tenDV" required="" class="form-control" value="${unitEditList.tenDV}"></td>
                                            </tr>
                                            <thead>
                                        </table>
                                        <input type="submit" value="SAVE" class="btn btn-primary btn-round" />
                                    </form>
                                    <a class="btn btn-primary btn-round" onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/unit'); window.history.go();">BACK</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="fragment/footer.jsp"%>

    <!-- JS -->
    <%@include file="fragment/importJS.jsp"%>

    <!-- End page content -->
    <script>
        $(document).ready(function () {
            $('#nav_unit').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>