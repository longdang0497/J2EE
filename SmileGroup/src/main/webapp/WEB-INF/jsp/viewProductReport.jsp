<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Product Report List</title>
    <%@include file="fragment/importLibs.jsp"%>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<%@include file="fragment/sidebar.jsp"%>

<!-- Top menu -->
<%@include file="fragment/header.jsp"%>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">

    <div>
        <form class="segment" method="post" action="/productReport&edit">
            <table class="fl-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="maBCHT" required="" class="segment-tb" value="${productReportEditList.maBCHT}"></td>
                </tr>
                <tr>
                    <th>Month</th>
                    <td>
                        <input type="number" name="thang" required="" class="segment-tb" value="${productReportEditList.thang}">
                    </td>
                </tr>
                <tr>
                    <th>Published Date</th>
                    <td><input type="text" name="ngayLap" required="" class="segment-tb" value="${productReportEditList.ngayLap}"></td>
                </tr>
                <tr>
                    <th>Employee</th>
                    <td>
                        <select name="tenNV" class="segment-tb" >
                            <c:forEach var="item" items="${empLists}">
                                <option value="${item.tenNV}" ${item.maNV == productReportEditList.employee.maNV ? 'selected="selected"' : ''}>${item.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Total Import</th>
                    <td><input type="number" name="tongNhap" required="" class="segment-tb" value="${productReportEditList.tongNhap}"></td>
                </tr>
                <tr>
                    <th>Total Export</th>
                    <td><input type="number" name="tongBan" required="" class="segment-tb" value="${productReportEditList.tongBan}"></td>
                </tr>
                <tr>
                    <th>Total Left</th>
                    <td><input type="number" name="tongTon" required="" class="segment-tb" value="${productReportEditList.tongTon}"></td>
                </tr>
                <thead>
            </table>
            <input type="submit" value="SAVE" />
        </form>
        <a href="/productReport">BACK</a>
    </div>
</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp"%>

<!-- End page content -->
</body>
</html>