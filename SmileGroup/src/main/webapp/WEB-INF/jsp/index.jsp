<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
    <head>
        <title>Customer List</title>
        <%@include file="fragment/importLibs.jsp"%>
    </head>
    <body>
        <!-- Sidebar (hidden by default) -->
        <%@include file="fragment/sidebar.jsp"%>

        <!-- Top menu -->
        <%@include file="fragment/header.jsp"%>

        <!-- PAGE CONTENT -->
        <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
            HELLO WORLD.
        </div>

        <!-- Footer -->
        <%@include file="fragment/footer.jsp"%>

        <!-- End page content -->
    </body>
</html>