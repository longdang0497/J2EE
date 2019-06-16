<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Log In</title>
    <%@include file="fragment/importLibs.jsp" %>
</head>
<body>

<!-- PAGE CONTENT -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;">
    <div class="w3-white w3-xlarge">
        <h1 class="w3-center" style="width: 100%;">SIGN IN</h1>
    </div>

    <div id="login">
        <form action="/home" method="post">
            <div style="text-align:center; padding: 1rem; height: calc(100vh - 21rem);">
                <h3>Welcome Back!</h3>
                <div class="field-wrap">
                    <label>
                        Username<span class="req">*</span>
                    </label>
                    <input id="username" name="username" type="text"required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        Password<span class="req">*</span>
                    </label>
                    <input id="password" name="password" type="password"required autocomplete="off"/>
                </div>

                <p class="forgot"><a href="#">Forgot Password?</a></p>

                <input type="submit" class="button button-block" value="SIGN IN"/>
            </div>

        </form>

    </div>
</div>

<%@include file="fragment/footer.jsp"%>
</body>
</html>