<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Report List</title>
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
        <h1 class="w3-left" style="width: 100%;">MANAGE PRODUCT REPORTS</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/productReport&save">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="maBCHT" class="segment-tb"/>
                        <label class="segment-lb">Employee</label>
                        <select name="tenNV" class="segment-tb">
                            <option>Choose an employee</option>
                            <c:forEach var="eList" items="${employeeLists}">
                                <option>${eList.tenNV}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <label class="segment-lb">Published Date (yyyy-mm-dd)</label>
                        <input type="text" name="ngayLap" required="" class="segment-tb" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Month</label>
                        <select name="thang" class="segment-tb">
                            <option>Choose a month</option>
                            <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
                        </select>
                    </td>
                    <td>
                        <input type="submit" value="SAVE"/>
                        <input type="button" value="REFRESH" onclick="window.location.href='/productReport'"/>
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
                <th>Month</th>
                <th>Published Date</th>
                <th>Employee</th>
                <th>Total Import</th>
                <th>Total Export</th>
                <th>Total Left</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${productReportLists}">
                <tr>
                    <td>${list.maBCHT}</td>
                    <td>${list.thang}</td>
                    <td>${list.ngayLap}</td>
                    <td>${list.employee.tenNV}</td>
                    <td>${list.tongNhap}</td>
                    <td>${list.tongBan}</td>
                    <td>${list.tongTon}</td>
                    <td>
                        <a href="/productReportInfo/details/${list.maBCHT}">Info</a>
                        <a href="/productReport/delete/${list.maBCHT}">Delete</a>
                        <a href="/viewBill/${list.maBCHT}">Edit</a>
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