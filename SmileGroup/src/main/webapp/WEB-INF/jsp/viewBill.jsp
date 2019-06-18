<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Bill List</title>
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
                                    <form class="segment" method="post" action="/bill&edit">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="text" name="maHD" readonly required="" class="form-control" value="${billEditList.maHD}"></td>
                                            </tr>
                                            <tr>
                                                <th>Employee</th>
                                                <td>
                                                    <select name="tenNV" class="form-control" >
                                                        <c:forEach var="item" items="${empLists}">
                                                            <option value="${item.tenNV}" ${item.maNV == billEditList.employee.maNV ? 'selected="selected"' : ''}>${item.tenNV}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Published Date</th>
                                                <td><input type="text" name="ngayLap" required="" class="form-control" value="${billEditList.ngayLap}"></td>
                                            </tr>
                                            <tr>
                                                <th>Customer</th>
                                                <td>
                                                    <select name="tenKH" class="form-control" >
                                                        <c:forEach var="item" items="${customerLists}">
                                                            <option value="${item.tenKH}" ${item.maKH == billEditList.customer.maKH ? 'selected="selected"' : ''}>${item.tenKH}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Tax Code</th>
                                                <td><input type="text" name="maSoThue" required="" class="form-control" value="${billEditList.maSoThue}"></td>
                                            </tr>
                                            <tr>
                                                <th>Total</th>
                                                <td><input type="number" name="tongTien" required="" class="form-control" value="${billEditList.tongTien}"></td>
                                            </tr>
                                            <thead>
                                        </table>
                                        <input class="btn btn-primary btn-round" type="submit" value="SAVE" />
                                        <a class="btn btn-primary btn-round" href="/bill">BACK</a>
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
            $('#nav_bill').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>