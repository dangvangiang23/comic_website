<%-- 
    Document   : login
    Created on : Jul 5, 2022, 3:34:28 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login form</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <script type='text/javascript'  src="js/login/hoamaijs.js"></script>
    </head>
    <body>


        <div class="center-box login" >

            <div class="box">
                <form method="POST" action="login">
                    <div class="box-title">
                        <img src="pages/AAAAAAA.png" alt="aaa">
                    </div>

                    <div class="box-body">
                        <label>
                            <input type="text" name="username"
                                   placeholder="Tài khoản ">
                        </label><br/><br/>
                    </div>

                    <div class="box-body">
                        <label>
                            <input type="password" name="password"
                                   placeholder="Mật khẩu">
                        </label>
                    </div>
                    <br/>
                    <div style="color:white">${message}</div><br/>
                    <div class="box-footer">
                        <div  class="signup" >
                            <a href="${pageContext.request.contextPath}/register" class="rg-btn" title="Đăng ký">Đăng ký</a>
                            <button type="submit" name="login" value="Đăng nhập">Đăng nhập</button>
                        </div>
                    </div>



                </form>

            </div>

        </div>

    </body>
</html>
