<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Import Product Information</title>
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
                                    <form class="segment" method="post" action="/importProduct-info&edit/${importProductInfoList.importProduct.maPN}">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="number" name="maCTPN" readonly required="" class="form-control" value="${importProductInfoList.maCTPN}"></td>
                                            </tr>
                                            <tr>
                                                <th>IP ID</th>
                                                <td><input type="number" name="maPN" required="" class="form-control" value="${importProductInfoList.importProduct.maPN}"></td>
                                            </tr>
                                            <tr>
                                                <th>Product</th>
                                                <td>
                                                    <select name="tenMH" class="form-control" >
                                                        <c:forEach var="item" items="${productLists}">
                                                            <option value="${item.tenMH}" ${item.maMH == importProductInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Listed Price</th>
                                                <td><input type="number" name="donGiaBan" required="" class="form-control" value="${importProductInfoList.donGiaBan}"></td>
                                            </tr>
                                            <tr>
                                                <th>Selling Price</th>
                                                <td><input type="number" name="donGia" required="" class="form-control" value="${importProductInfoList.donGia}"></td>
                                            </tr>
                                            <tr>
                                                <th>Quantities</th>
                                                <td><input type="number" name="soLuong" required="" class="form-control" value="${importProductInfoList.soLuong}"></td>
                                            </tr>
                                            <tr>
                                                <th>Total</th>
                                                <td><input type="number" name="tongTien" required="" class="form-control" value="${importProductInfoList.tongTien}"></td>
                                            </tr>
                                            <tr>
                                                <th>Note</th>
                                                <td><input type="text" name="ghiChu" required="" class="form-control" value="${importProductInfoList.ghiChu}"></td>
                                            </tr>
                                            <thead>
                                        </table>
                                        <input type="submit" class="btn btn-primary btn-round" value="SAVE" />
                                        <a class="btn btn-primary btn-round" href="/importProduct/details/${importProductInfoList.importProduct.maPN}">BACK</a>
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
            $('#nav_importProduct').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>