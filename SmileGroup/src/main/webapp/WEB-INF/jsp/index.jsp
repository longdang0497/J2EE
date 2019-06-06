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

        <div class="slideshow-container">

            <div class="mySlides fade">
                <img src="https://images.unsplash.com/photo-1516542076529-1ea3854896f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="https://images.unsplash.com/photo-1473831818960-c89731aabc3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="https://images.unsplash.com/photo-1548484352-ea579e5233a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" style="width:100%">
            </div>

        </div>
        <br>

        <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

        </div>

        <!-- Footer -->
        <%@include file="fragment/footer.jsp"%>

        <!-- End page content -->
    </body>
    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    </script>
</html>