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
        <h1 class="w3-center" style="width: 100%; margin-top: 1rem; font-weight: 400;">SIGN IN</h1>
    </div>

    <div id="login">
        <form action="/home" method="post">
            <div style="text-align:center; padding: 1rem; height: calc(100vh - 22rem);">
                <h3>Welcome Back!</h3>
                <div class="field-wrap">
                    <label style="width: 12%;">
                        Username<span class="req">*</span>
                    </label>
                    <input id="username" name="username" style="padding-left: 1rem; width: 15%; line-height: 1.8rem; border: solid black 0.15rem; border-radius: 1rem;" type="text"required autocomplete="off"/>
                </div>
                <br/>
                <div class="field-wrap">
                    <label style="width: 12%;">
                        Password<span class="req">*</span>
                    </label>
                    <input id="password" name="password" style="padding-left: 1rem; width: 15%; line-height: 1.8rem; border: solid black 0.15rem; border-radius: 1rem;" type="password"required autocomplete="off"/>
                </div>

                <p class="forgot" style="margin-top: 1rem; color: #1dd15d;"><a href="#">Forgot Password?</a></p>

                <input type="submit" style="width: 15%; color: white; background-color: #1dd15d; line-height: 2.5rem; border: solid black 0.05rem; border-radius: 1rem; text-align: center; font-weight: bold;" value="SIGN IN"/>
            </div>

        </form>

    </div>
</div>

<%@include file="fragment/footer.jsp"%>
</body>
</html>