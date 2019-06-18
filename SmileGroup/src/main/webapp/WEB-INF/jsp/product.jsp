<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product List</title>
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
                            <h5 class="card-title">MANAGE PRODUCTS</h5>
                        </div>
                        <form class="card-body" method="post" action="/product&save">
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maMH" class="form-control"/>
                                        <label class="segment-lb">Name</label>
                                        <input type="text" name="tenMH" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Unit</label>
                                        <select name="tenDV" class="form-control">
                                            <option>Choose a unit</option>
                                            <c:forEach var="uList" items="${unitLists}">
                                                <option>${uList.tenDV}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="segment-lb">Manufacturer</label>
                                        <input type="text" name="hangSX" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Type</label>
                                        <select name="tenLoai" class="form-control">
                                            <option>Choose a type</option>
                                            <c:forEach var="tList" items="${tocLists}">
                                                <option>${tList.tenLoai}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="segment-lb">Description</label>
                                        <input type="text" name="cauHinh" required="" class="form-control"/>
                                    </td>
                                    <td>
                                        <label class="segment-lb">Store</label>
                                        <select name="tenKhu" class="form-control" value="">
                                            <option>Choose a store</option>
                                            <c:forEach var="sList" items="${storeLists}">
                                                <option>${sList.tenKhu}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="maMH" class="form-control"/>
                                        <label class="segment-lb">Quantities</label>
                                        <input type="text" name="soLuong" required="" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" value="SAVE" class="btn btn-primary btn-round"/>
                            <input type="button" value="REFRESH" class="btn btn-primary btn-round" onclick="window.location.href='/product'"/>
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
                                        <th>Manufacturer</th>
                                        <th>Unit</th>
                                        <th>Description</th>
                                        <th>Type</th>
                                        <th>Store</th>
                                        <th>Quantities</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${productLists}">
                                        <tr>
                                            <td>${list.maMH}</td>
                                            <td>${list.tenMH}</td>
                                            <td>${list.hangSX}</td>
                                            <td>${list.unit.tenDV}</td>
                                            <td>${list.cauHinh}</td>
                                            <td>${list.type.tenLoai}</td>
                                            <td>${list.store.tenKhu}</td>
                                            <td>${list.soLuong}</td>
                                            <td>
                                                <a href="/product/delete/${list.maMH}" onclick="return confirm('Do you want to delete this?')">Delete</a>
                                                <a href="/viewProduct/${list.maMH}">Edit</a>
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
        $('#nav_product').addClass('active');
    });
</script>
</div>
</body>
</html>