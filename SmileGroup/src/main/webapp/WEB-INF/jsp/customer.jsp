<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.springframework.org/schema/data/jaxb">
<head>
    <title>Customer List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="semantic/dist/semantic.min.js"></script>
    <style>
        body {font-family: "Karma", sans-serif}
        body, h1,h2,h3,h4,h5,h6 {font-family: "Cambria";}
        .w3-bar-block .w3-bar-item {padding:20px}
        table {
            font-family: "Helvetica Neue", sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()"
       class="w3-bar-item w3-button">Close Menu</a>
    <a href="~/customer.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Customer</a>
    <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">About</a>
</nav>

<!-- Top menu -->
<div class="w3-top">
    <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto">
        <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">=</div>
        <div class="w3-right w3-padding-16">Mail</div>
        <div class="w3-center w3-padding-16">SMILE GROUP</div>
    </div>
</div>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">
    <div class="w3-white w3-xlarge">
        <h1 class="w3-left" style="width: 100%;">MANAGE CUSTOMER</h1>
    </div>

    <div>
        <form class="segment" method="post" action="/customer&save">
            <table>
                <tr>
                    <td>
                        <label class="segment-lb">ID</label>
                        <input type="text" name="maKH" class="segment-tb"/>
                    </td>
                    <td>
                        <label class="segment-lb">Email</label>
                        <input type="text" name="email" required="" class="segment-tb"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Name</label>
                        <input type="text" name="tenKH" required="" class="segment-tb"/>
                    </td>
                    <td class="form-list__row">
                        <label class="segment-lb">Phone</label>
                        <input type="text" name="soDT" required="" class="segment-tb"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="segment-lb">Address</label>
                        <input type="text" name="diaChi" required="" class="segment-tb"/>
                    </td>
                    <td>
                        <input type="submit" value="SAVE" />
                        <button>REFRESH</button>
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
                <th>Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${customerLists}">
                <tr>
                    <td>${list.maKH}</td>
                    <td>${list.tenKH}</td>
                    <td>${list.diaChi}</td>
                    <td>${list.email}</td>
                    <td>${list.soDT}</td>
                    <td>
                        <a href="/customer/delete/${list.maKH}">Delete</a>
                        <a href="/viewCustomer/${list.maKH}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>

<!-- Footer -->
<!--<footer class="w3-row-padding w3-padding-32">
    <div class="w3-third">
        <h3>FOOTER</h3>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </div>

    <div class="w3-third">
        <h3>BLOG POSTS</h3>
        <ul class="w3-ul w3-hoverable">
            <li class="w3-padding-16">
                <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
                <span class="w3-large">Lorem</span><br>
                <span>Sed mattis nunc</span>
            </li>
            <li class="w3-padding-16">
                <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
                <span class="w3-large">Ipsum</span><br>
                <span>Praes tinci sed</span>
            </li>
        </ul>
    </div>

    <div class="w3-third w3-serif">
        <h3>POPULAR TAGS</h3>
        <p>
            <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dinner</span>
            <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Salmon</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">France</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Drinks</span>
            <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Flavors</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Cuisine</span>
            <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Chicken</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dressing</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fried</span>
            <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fish</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Duck</span>
        </p>
    </div>
</footer>-->

<!-- End page content -->
<!--</div>-->

    <script>
        // Script to open and close sidebar
        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
        }

        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }
    </script>
</body>
</html>