<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Order Information</title>
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
                                    <form class="segment" method="post" action="/order-info&edit/${orderInfoList.order.maDDH}">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="number" name="maCTDDH" readonly required="" class="form-control" value="${orderInfoList.maCTDDH}"></td>
                                            </tr>
                                            <tr>
                                                <th>Bill ID</th>
                                                <td><input type="number" name="maDDH" required="" class="form-control" value="${orderInfoList.order.maDDH}"></td>
                                            </tr>
                                            <tr>
                                                <th>Product</th>
                                                <td>
                                                    <select name="tenMH" class="form-control" >
                                                        <c:forEach var="item" items="${productLists}">
                                                            <option value="${item.tenMH}" ${item.maMH == orderInfoList.product.maMH ? 'selected="selected"' : ''}>${item.tenMH}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Quantities</th>
                                                <td><input type="number" name="soLuong" required="" class="form-control" value="${orderInfoList.soLuong}"></td>
                                            </tr>
                                            <thead>
                                        </table>
                                        <input class="btn btn-primary btn-round" type="submit" value="SAVE" />
                                        <a class="btn btn-primary btn-round" href="/order/details/${orderInfoList.order.maDDH}">BACK</a>
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
            $('#nav_order').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>