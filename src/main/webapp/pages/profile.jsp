<%-- 
    Document   : profile
    Created on : Jul 10, 2022, 4:24:35 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

        <link rel="stylesheet" href="Profile.css"/>

    </head>
    <body>
        <div class="wrapper">
            <div class="wrapper">
                <div class="header" id='header'>
                    <div class="inner-header" style="top: 0px">
                        <div class="row_clearfix">
                            <div class="logo" >
                                <a href="${pageContext.request.contextPath}/home"><img src="AAAAAAA.png" width="180px" height="40px"></a>
                            </div>


                            <c:if test="${sessionScope.userLogged != null}">
                                <div class="user-menu">
                                    <a href="#" onclick="clickUser()">
                                        <img class="user-avatar" src="separate_page/avatar-meo-con-khung-long.jpg" alt="user avatar" width="18" height="18">
                                    </a>		

                                    <div class="login" id="loginbutton"> 

                                        <div class="login kkk"><a href="${pageContext.request.contextPath}/pages/profile.jsp" id="sss">${username}</a></div>

                                        <div class="login sss"> <a href="${pageContext.request.contextPath}/logout" id="kkk">Đăng xuất</a> </div>


                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.userLogged == null}">
                                <div class="user-menu" onclick="clickUser()">
                                    <a href="#" >
                                        <img class="user-avatar" src="https://png.pngtree.com/png-clipart/20230805/original/pngtree-spy-flat-gray-color-rounded-vector-icon-mafia-donut-human-vector-picture-image_9728757.png" alt="user avatar" width="18" height="18">
                                    </a>		

                                    <div class="login" id="loginbutton"> 

                                        <div class="login kkk"><a href="${pageContext.request.contextPath}/login" id="sss">Đăng nhập</a></div>
                                        <div class="login sss"> <a href="${pageContext.request.contextPath}/register" id="kkk">Đăng kí</a> </div>


                                    </div>
                                </div>
                            </c:if>






                            <div class="search-box">

                                <form method="get" action="search">
                                    <div class="search-wrapper">
                                        <input type="text" name="search-input" placeholder="Nhập tên truyện...">
                                        <button> 
                                            <svg fill="#000" height="16px" width="16px" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 513.28 513.28" xml:space="preserve"><path d="M495.04,404.48L410.56,320c15.36-30.72,25.6-66.56,25.6-102.4C436.16,97.28,338.88,0,218.56,0S0.96,97.28,0.96,217.6 s97.28,217.6,217.6,217.6c35.84,0,71.68-10.24,102.4-25.6l84.48,84.48c25.6,25.6,64,25.6,89.6,0 C518.08,468.48,518.08,430.08,495.04,404.48z M218.56,384c-92.16,0-166.4-74.24-166.4-166.4S126.4,51.2,218.56,51.2 s166.4,74.24,166.4,166.4S310.72,384,218.56,384z"></path></svg> </button>
                                    </div>	

                                </form>
                            </div>	



                        </div>



                    </div>


                </div> 

                <div class='wrapper-body'>	
                    <div class="wrapper-body content">
                        <div class="row content-inner clearfix">		
                            <div class="user-sidebar">

                                <ul>		 <!--/member/dashboard    -->
                                    <li><a href="${pageContext.request.contextPath}/pages/profile.jsp">Thông tin cá nhân</a></li>
                                    <li><a href="${pageContext.request.contextPath}/change">Thay đổi thông tin cá nhân</a></li>
                                    <li><a href="#">Truyện theo dõi</a></li>  
                                    <li><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>

                                    <c:if test="${sessionScope.userLogged != null}" >
                                        <c:if test="${sessionScope.userLogged.role eq true}">
                                            <li><a href="/pages/quanglybox.jsp">Quản lý box</a></li>
                                            </c:if>
                                        </c:if>

                                </ul>



                            </div>
                            <div class="user-form">
                                <div class="box-title"> 
                                    <h2>Thông tin cá nhân</h2>
                                    <i class="fa fa-angle-right"></i>
                                </div>
                                <div class="d-profile"> 
                                    <div class="d-title clearfix">
                                        <p> Tên đăng nhập: ${sessionScope.username}</P>
                                        <p>Biệt danh (nickname): ${sessionScope.username}</p>
                                        <p>Giới tính: unknown</p>

                                    </div>

                                </div>
                                <div class="box-title"> 
                                    <h2>Comment gần đây</h2>                                 
                                    <a href="${pageContext.request.contextPath}/pages/commentUser.jsp" style="font-size: 13px; text-transform: none;"> Xem all > </a>
                                </div>
                            </div>	
                            <div class="u-cmt-item clearfix">
                                <div class="u-img-holder">
                                    <a href="#"><img src="http://otruyentranh.com/img/274/16558284324717ac-ma-treu-choc-moi-ngay.jpeg"></a>
                                </div>
                                <div class="u-manga-title"><a title="Ác Ma Trêu Chọc Mỗi Ngày" href="#">Ác Ma Trêu Chọc Mỗi Ngày</a></div>
                                <div class="u-cmt-content">
                                    ${chapter} <br/>
                                    ${nick}: mlem mlem n9
                                </div>

                            </div>			

                        </div>					

                    </div>	

                </div>








            </div>
            <div class="footer">
                <div class="row clearfix">
                    <div class="ft-left">
                        <p><img src="" name="logo"></p>
                        <p><a href="/home">Real love manga nơi làm rung động trái tim bạn </a></p>
                        <p>Copyright Gina_chan</p>
                    </div>
                </div>

            </div>

        </div>
        <script type="text/javascript">

            function HienthiSearchTruyen() {
                var x = document.getElementById("category");

                if (x.style.display === "none") {
                    x.style.display = "block";

                } else {
                    x.style.display = "none";

                }


            }
            function clickUser()
            {
                var y = document.getElementById("loginbutton");

                if (y.style.display === "none") {

                    y.style.display = "block";
                } else {

                    y.style.display = "none";
                }



            }


        </script>


    </body>
</html>
