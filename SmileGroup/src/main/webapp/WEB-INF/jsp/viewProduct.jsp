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
                                    <form class="segment" method="post" action="/product&edit">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <tr>
                                                <th>ID</th>
                                                <td><input type="text" name="maMH" readonly required="" class="form-control" value="${productEditList.maMH}"></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><input type="text" name="tenMH" required="" class="form-control" value="${productEditList.tenMH}"></td>
                                            </tr>
                                            <tr>
                                                <th>Manufacturer</th>
                                                <td><input type="text" name="hangSX" required="" class="form-control" value="${productEditList.hangSX}"></td>
                                            </tr>
                                            <tr>
                                                <th>Unit</th>
                                                <td>
                                                    <select name="tenDV" class="form-control" >
                                                        <c:forEach var="item" items="${unitLists}">
                                                            <option value="${item.tenDV}" ${item.maDV == productEditList.unit.maDV ? 'selected="selected"' : ''}>${item.tenDV}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <td><input type="text" name="cauHinh" required="" class="form-control" value="${productEditList.cauHinh}"></td>
                                            </tr>
                                            <tr>
                                                <th>Type</th>
                                                <td>
                                                    <select name="tenLoai" class="form-control" >
                                                        <c:forEach var="item" items="${tocLists}">
                                                            <option value="${item.tenLoai}" ${item.maLoai == productEditList.type.maLoai ? 'selected="selected"' : ''}>${item.tenLoai}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Store</th>
                                                <td>
                                                    <select name="tenKhu" class="form-control" >
                                                        <c:forEach var="item" items="${storeLists}">
                                                            <option value="${item.tenKhu}" ${item.maKhu == productEditList.store.maKhu ? 'selected="selected"' : ''}>${item.tenKhu}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Quantities</th>
                                                <td><input type="text" name="soLuong" required="" class="form-control" value="${productEditList.soLuong}"></td>
                                            </tr>
                                            <thead>
                                        </table>
                                        <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                                        <a href="/product" class="btn btn-primary btn-round">BACK</a>
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
            $('#nav_product').addClass('active');
        });
    </script>
    <!-- End page content -->
</div>
</body>
</html>