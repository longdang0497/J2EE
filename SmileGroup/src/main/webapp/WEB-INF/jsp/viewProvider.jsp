<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Provider List</title>
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
                                    <form class="segment" method="post" action="/provider&edit">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="text" name="maNCC" readonly required="" class="form-control" value="${providerEditList.maNCC}"></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><input type="text" name="tenNCC" required="" class="form-control" value="${providerEditList.tenNCC}"></td>
                                            </tr>
                                            <tr>
                                                <th>Address</th>
                                                <td><input type="text" name="diaChiNCC" required="" class="form-control" value="${providerEditList.diaChiNCC}"></td>
                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td><input type="text" name="emailNCC" required="" class="form-control" value="${providerEditList.emailNCC}"></td>
                                            </tr>
                                            <tr>
                                                <th>Phone</th>
                                                <td><input type="text" name="soDTNCC" required="" class="form-control" value="${providerEditList.soDTNCC}"></td>
                                            </tr>
                                            </thead>
                                        </table>
                                        <input type="submit" class="btn btn-primary btn-round" value="SAVE" />
                                        <a class="btn btn-primary btn-round" href="/provider">BACK</a>
                                    </form>
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
            $('#nav_provider').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>