<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Report Info List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE PRODUCT REPORTS INFORMATION</h1>
    </div>

    <div>
        <a href="/productReport/">BACK</a>
<%--        <form class="segment" method="post" action="/productReport&save/${maBCHT}">--%>
<%--&lt;%&ndash;            <table>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="hidden" name="maCTBC" class="segment-tb"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <label class="segment-lb">Product Report ID</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="text" name="maBCHT" required="" class="segment-tb" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <label class="segment-lb">Product</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <select name="tenMH" class="segment-tb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <option>Choose a product</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <c:forEach var="pList" items="${productLists}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <option>${pList.tenMH}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="submit" value="SAVE"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="button" value="REFRESH" onclick="window.location.href='/productReportInfo/details/${maBCHT}'"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </table>&ndash;%&gt;--%>
<%--        </form>--%>
    </div>
    <div>
        <table class="fl-table">
            <thead>
            <tr>
<%--                <th>ID</th>--%>
<%--                <th>PR ID</th>--%>
                <th>Product</th>
                <th>Import</th>
                <th>Export</th>
                <th>Left</th>
<%--                <th>Actions</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${productReportInfoLists}">
                <tr>
<%--                    <td>${list.maCTBC}</td>--%>
<%--                    <td>${list.productReport.maBCHT}</td>--%>
                    <td>${list.tenMH}</td>
                    <td>${list.luongNhap}</td>
                    <td>${list.luongBan}</td>
                    <td>${list.luongTon}</td>
                    <td>
<%--                        <a href="/productReport/details/${list.productReport.maBCHT}/delete/${list.maCTBC}">Delete</a>--%>
<%--                        <a href="/viewProductReportInfo/${list.maCTBC}">Edit</a>--%>
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