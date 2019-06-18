<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Bill Information</title>
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
                                    <form class="segment" method="post" action="/bill-info&edit/${billInfoList.bill.maHD}">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="number" name="maCTHD" readonly required="" class="form-control" value="${billInfoList.maCTHD}"></td>
                                            </tr>
                                            <tr>
                                                <th>Bill ID</th>
                                                <td><input type="number" name="maHD" required="" class="form-control" value="${billInfoList.bill.maHD}"></td>
                                            </tr>
                                            <tr>
                                                <th>Product</th>
                                                <td>
                                                    <select name="tenMH" class="form-control" >
                                                        <c:forEach var="item" items="${productLists}">
                                                            <option value="${item.tenMH}" ${item.maMH == billInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Selling Price</th>
                                                <td><input type="number" name="donGia" required="" class="form-control" value="${billInfoList.donGia}"></td>
                                            </tr>
                                            <tr>
                                                <th>Quantities</th>
                                                <td><input type="number" name="soLuong" required="" class="form-control" value="${billInfoList.soLuong}"></td>
                                            </tr>
                                            <tr>
                                                <th>Total</th>
                                                <td><input type="number" name="tienThanhToan" required="" class="form-control" value="${billInfoList.tienThanhToan}"></td>
                                            </tr>
                                            <thead>
                                        </table>
                                        <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                                        <a class="btn btn-primary btn-round" href="/bill/details/${billInfoList.bill.maHD}">BACK</a>
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