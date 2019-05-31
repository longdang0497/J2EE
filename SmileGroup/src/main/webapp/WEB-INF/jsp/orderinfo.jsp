<%@ page import="java.util.Optional" %>
<%@ page import="com.smilegroup.componentmanagement.Models.Product" %>
<%@ page import="com.smilegroup.componentmanagement.DAO.ProductRepository" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bill Info List</title>
    <%@include file="fragment/importLibs.jsp" %>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<%@include file="fragment/sidebar.jsp" %>

<!-- Top menu -->
<%@include file="fragment/header.jsp" %>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">
    <div class="w3-white w3-xlarge">
        <h1 class="w3-left" style="width: 100%;">MANAGE BILLS INFORMATION</h1>
    </div>

    <div>
        <a href="/bill/">BACK</a>
        <form name="biForm" class="segment" method="post" action="/bill-info&save/${maHD}">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maCTHD" class="segment-tb"/>
                        <label class="segment-lb">Bill ID</label>
                        <input name="maHD" type="number" required="" value="${maHD}" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Product</label>
                        <select name="tenMH" class="segment-tb">
                            <option>Choose a product</option>
                            <c:forEach var="pList" items="${productLists}">
                                <option>${pList.tenMH}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Selling price</label>
                        <%--                        <select name="tenNV" class="segment-tb" >--%>
                        <%--                            <c:forEach var="item" items="${productLists}">--%>
                        <%--                                <option value="${item.donGia}" ${item.tenMH == request.getParameter("tenKH") ? 'selected="selected"' : ''}>${item.donGia}</option>--%>
                        <%--                            </c:forEach>--%>
                        <%--                        </select>--%>
                        <input id="biPrice" type="number" name="donGia" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Quantities</label>
                        <input id="biQuantities" type="number" name="soLuong" value="0" required="" class="segment-tb"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Total</label>
                        <input id="biTotal" type="number" value="" name="tienThanhToan" class="segment-tb" onclick="calculate()"/>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/bill/details/${maHD}'"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div>
        <table class="fl-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Bill ID</th>
                <th>Product</th>
                <th>Selling price</th>
                <th>Quantities</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${billInfoList}">
                <tr>
                    <td>${list.maCTHD}</td>
                    <td>${list.bill.maHD}</td>
                    <td>${list.product.tenMH}</td>
                    <td>${list.donGia}</td>
                    <td>${list.soLuong}</td>
                    <td>${list.tienThanhToan}</td>
                    <td>
                        <a href="/bill/details/${list.bill.maHD}/delete/${list.maCTHD}">Delete</a>
                        <a href="/viewBillInfo/${list.maCTHD}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>