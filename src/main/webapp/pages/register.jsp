<%-- 
    Document   : register
    Created on : Jul 10, 2022, 2:20:23 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
           <script type='text/javascript'  src="js/login/hoamaijs.js"></script>
            <link rel="stylesheet" href="pages/register.css"/>
        <style>
            .login{
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;

            }

            .box {
                padding: 30px 68px 30px 30px;
                border-radius: 4px;
                box-shadow: 1px 0px 7px #bdbdbd;
                /* margin-right: 31px; */
                background: #fff url(https://mcdn.wallpapersafari.com/medium/7/85/LRFqhu.jpg);
            }
            form{
                width: 250px;
            }
            .box-title img{
                width: 250px;
                height: 50px;
                position: relative;
                margin-left: 20px;
                border-radius: 50px;

            }
            .box-body{
                margin-top: 30px;
            }
            .box-footer{
                margin-top: 20px;
            }
            .box-footer a{
                text-decoration: none;
                background: orange;
                box-shadow: 1px 0px 7px #bdbdbd;
                color: white;

            }

            .box-body input[type=password], .box-body input[type=text] {
                background: #fff;
                border-radius: 4px;
                color: #333;
                border: 1px solid #ddd;
                height: 36px;
                position: relative;
                z-index: 2;
                padding: 0 15px;
                width: 100%;
                font-size: 14px;
            }
            .box-footer .signup {
                font-size: 20px;
            }
            .signup a{
                float:  right;
                color: #fff;
                padding: 10px 25px;
                border: none;
                cursor: pointer;
                font-size: 14px;
                border-radius: 4px;
                transition: all .3s ease;
                background: #f0ad4e;
            }
            .signup a {
                float:  left;
            }
            .captcha {
                margin-top: 0px;
                width: 51px;
                height: 20px;
                display: inline-block;
            }
            .captcha-holder{
                display: inline-block;
            }
            .codecap{
                color: white;
            }
            .signup{
                position: relative;
                margin-left:100px;
            }
            .rg-btn {

                width: 90px;
                height: 30px;
                color: white;
                border: none;
                border-radius: 4px;
                font-weight: bold;
                font-size: 16px;
                background-color: orange;
                cursor: pointer;
            }



        </style>
    </head>
    <body>

        <div class="center-box login" >
            <div class="box">
                <form method="POST" action="register" >
                    <div class="box-title">
                        <img src="pages/AAAAAAA.png" alt="">
                    </div>

                    <div class="box-body">
                        <label>
                            <input type="text" name="rgusername"
                                   placeholder="Tên tài khoản ">
                        </label><br/><br/>
                    </div>

                    <div class="box-body">
                        <label>
                            <input type="password" name="rgpassword"
                                   placeholder="Mật khẩu">
                        </label>
                    </div>
                    <br/>
                    <div class="box-body">
                        <label>
                            <input type="password" name="repassword"
                                   placeholder="Nhập lại mật khẩu">
                        </label>
                    </div>
                    <br/>
                    <div style="color:white">${requestScope.rgmessage}</div><br/>
                    <div class="box-footer">
                        <div  class="signup" >
                            <input type="submit" class="rg-btn" value="Đăng ký">
                            <a style="margin-top:10px;width:70px;font-size:15px;padding-right:4px;float: right;padding-left:18px;" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                            <a href="${pageContext.request.contextPath}//home" style="float: right;padding-left:18px;"> Home </a>
                        </div>
                    </div>
                </form>
            </div>



        </div>
      

    </body>
</html>
