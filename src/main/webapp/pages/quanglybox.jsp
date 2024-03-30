<%-- 
    Document   : homepage
    Created on : Jul 5, 2022, 4:33:04 PM
    Author     : MSI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Real love Manga</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="pages/homepage.css"/>
        <style>
            body{
                position:  relative;
                min-height: 100%;
                font-size: 16px;
                overflow-x: hidden;
                overflow-y:  scroll;
                color: #333;
                font-family: Tahoma,sans-serif,Helvetica,Arial;
                margin-top: 1px;
            }
            .header{
                width : 100%;
                height:  56px;
                position: relative;
                z-index: 6;
                background-color: lightpink;
            }
            .wrapper{
                overflow: auto;
                transition:  all ease .2s;
                height:  100%;
            }
            .row{
                padding:  0px;
                margin:  auto;
                height: 100%;
            }
            .logo {
                float:  left;
                margin-right: 20px;
                padding:  5px 0;
                padding-left: 50px;
                border-radius: 4px;
            }
            .logo img{
                border-radius: 10px;
            }
            .nav{
                float: left;
                padding-top: 2px;

            }
            ul{
                list-style: none;
            }
            .nav ul li > a {
                display: block;
                color: #fff;
                font-weight: bold;
                font-size: 18px;
            }
            a{
                text-decoration: none;
                color:  black;
            }
            .nav ul li{
                position:  relative;
                float:  left;
                margin-right: 10px;
                margin-left:  30px;
                padding-right: 10px;
                border-right: 1px solid #fff;
                background-color: pink;
                border-radius: 6px;
            }
            .nav ul li:last-child {
                margin-right:  0;
            }
            .header>.inner {
                padding: 8px 0;
                width:  100%;
                background-color: green;
                position:  fixed;
                z-index: 9;
            }
            .search-box{

            }
            .nav svg {
                width: 12px;
                height: 12px;
                vertical-align: middle;
                fill: #fff;
                margin-left: 5px;
            }
            .dropdown{
                position:  absolute;
                display: block;
            }
            .search-box{
                position: relative;
                float: left;
                height: 40px;
                width:  200px;
                padding:  5px;
                border-radius: 4px;
                padding-left: 56px;
                padding-top: 12px;
            }
            .search-box input{
                position:  relative;
                background: #fff;
                border:  none;
                font-size: 12px;
                vertical-align: middle;
                color:#E35335;
                height:  30px;
                width: 250px;
                padding: 0 40px 0 20px;
                border-radius: 2px;
            }
            .search-wrapper{
                width: 350px;
            }
            .search-box button{
                height:  32px;
                top: 0px;
                right: 0px;
                width: 40px;
                cursor: pointer;
                vertical-align: middle;
            }
            .user img{
                width:  30px;
                vertical-align: middle;
                border-radius: 2px;
                height: 30px;
            }
            .user-menu {
                cursor: pointer;
                border-radius: 4px;
                float: right;
                margin: auto;
                position: relative;
                margin-top: 12px;
                margin-right: 135px;
                background-color: whitesmoke;
                height: 31px;
                width: 34px;
            }
            .user-avatar{
                margin-left: 8px;
                margin-top: 6px;
            }

            .wrapper-body .inner {
                background-color: rgba(242, 210, 189, 0.2);
                margin-left: 100px;
                margin-right: 100px;
            }
            .wrapper-body .search-input {
                background-color: rgba(255, 182, 193, 0.75);
                width: 481px;
                height: 86px;
                margin: 0px 300px;
                border-radius: 5px;
                padding-left: 10px;
                padding-top: 13px;
                padding-right: 5px;
                margin-top: 0px;
                font-family: Tahoma,sans-serif,Helvetica,Arial;
                display: none;
            }
            input[type=checkbox] {
                margin: 4px 0 0;
                margin-top: 1px;
                line-height: normal;
                margin-right: 10px;
            }
            .wrapper-body .inner button {
                float: right;
                height: 30px;
                width: 74px;
                background-color: rgba(231,139,163,0.7);
                border-radius: 5px;
                color: white;
                cursor: pointer;
                border: none;
                color: white;
                text-shadow: 1px 1px 2px #ff8f8f, 0 0 25px #f289b5, 0 0 5px #d30f62;
                box-shadow: 2px 5px #c582a6;
            }

            .manga-list .m-item:nth-child(4n+1){
                clear: both;

            }
            .m-item {
                width: 24%;
                padding: 0 10px;
                margin-bottom: 20px;
                display: inline-block;
            }
            .m-img{
                width: 100%;
                float: left;
                overflow: hidden ;
                border-radius: 4px;
                height: 215px;
                margin-bottom: 10px;

            }
            .m-wrap{
                float: left;
                width: 100%;
            }
            .m-title{
                line-height: 20px;
                font-weight: bold;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                font-size: 14px;
                -webkit-box-orient:  vertical;
                height: 40px;

            }
            a{
                text-decoration: none;
                font-size: 100%;
                vertical-align: baseline;
                background: 0 0;
                font-weight: 400;
            }
            .m-title a{
                color: #333;
                transition: all ease .2s;
                font-weight: 600px;
                font-size: 15px;
            }
            .m-chapters{
                margin-top: 10px;

            }
            ul{
                list-style: none;
            }
            .m-chapters ul li{
                margin-bottom: 6px;
                white-space: nowrap;
                overflow: hidden;
                display: list-item;
                align-items: center;
            }
            .m-chapters ul li a{
                transition: all .2s ease;
                font-size: 14px;
            }
            .m-chapters ul li span{
                margin-left: 5px;
                font-size: 12px;
                vertical-align: middle;
                color: #9f9f9f;
                font-style: italic;
                float: right;
                line-height: 20px;
            }
            .m-chapters ul li:last-child{
                margin-bottom: 0px;
            }
            ul{
                padding-left: 0px;
            }
            .m-img img{
                width: 100%;
                height: auto;

            }
            img {
                vertical-align: bottom;
            }
            h1 {
                font-weight: 400;
                display: inline-block;
                font-size: 16px;
                margin-top: 50px;
                margin-left: 17px;
            }
            .nav {
                padding-left: 38px;
                margin-top: 15px;
                list-style: none;
            }
            .box-title h2{
                margin-bottom: 20px;
                text-transform: uppercase;
                color: #fe94a6;
                font-weight: bold;
                font-size: 16px;
            }
            .wrapper-body .inner button:hover{
                background-color: #ff9999;
                box-shadow: none;
                transition: 0.2s ease-in;
            }
            .container-fluid {
                padding-right: 0;
                padding-left: 6px;
                margin-right: auto;
                margin-left: auto;
            }
            .login {
                position: relative;
                display: box;
                display: inline-block;
                margin-top: 9px;
                background-color: #ffddd4;
                width: 88px;
                padding-left: 5px;
                line-height: 45px;
                border-radius: 4px;
                text-decoration:  none;
            }
            .kkk{
                border: 1px;
                position:  relative;

            }
            .sss:hover, .kkk:hover{
                background-color: #ff9999;
                text-decoration:  none;
            }

            .col-right{
                float: right;
            }
            .box-title{
                margin-bottom: 20px;
                text-transform: uppercase;
                color:  #fe94a6;
            }
            .box-title .h-title h2{
                float: left;
            }
            .box-title h2{
                font-weight:  bold;
            }
            .box-title .h-title a{
                transition: all 0.2s ease;
                font-size: 14px;
            }
            .history{
                margin-bottom: 20px;
                padding:  20px;
                border-radius: 4px;
                border: 1px solid #ddd;
            }
            .clearfix{
                list-style: none;
            }
            .history ul li .r-img{
                height: 60px;
                overflow: hidden;
            }
            .r-img{
                float: left;
                width: 60px;
                border-radius: 4px;
                margin-right: 10px;
            }
            .r-img img{
                width:  127%;
                height: auto;
            }
            a{
                text-decoration: none;
            }
            .r-title{
                overflow: hidden;
                text-overflow: ellipsis;
                display: box;
                -webkit-line-clamp: 2;
                -webkit-box-orient:  vertical;
                line-height: 24px;
            }
            .r-title a{
                transition:  all .2s ease;
                font-size: 18px;
                padding-left: 21px;
            }
            .r-chapter{
                margin-top: 10px;
                margin-left: 100px;
                font-size: 16px;
            }
            .history .r-chapter a {
                font-style:  italic;
                font-size: 16px;
                padding-left: 21px;
            }
            .history ul il{
                float: left;
                width:  100%;
                margin-bottom: 10px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ddd;
            }
            ul li:last-child{
                margin-bottom: 0;
                border: none;
                padding:  0;
            }
            .ranking ul li{
                float: left;
                width:  100%;
                margin-bottom: 10px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ddd;
            }

            .cmt-item{
                margin-bottom: 10px;
                padding-bottom: 10px;
                border-bottom: 1px solid #cecece;

            }
            .cmt-manga{
                font-size: 14px;
                margin-bottom: 10px;
                overflow:  hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient:  vertical;
            }
            .cmt-manga a {
                color:  #0000;
            }
            .avatar{
                width:  7%;
                float:  left;
                margin-left: 10px;
            }
            .avatar img {
                width: 100%;
                border-radius: 7px;
                height: auto;
                margin-top: 5px;
            }
            img{
                vertical-align: bottom;
            }
            .cmt-user-name{
                margin-bottom: 5px;
            }
            .cmt-user-name .nickname {
                color: #7f00a5;
                display: inline-block;
                margin-right: 114px;
                margin-left: 22px;
                vertical-align: middle;
                line-height: 24px;
                font-size: 16px;
            }
            .cmt-chapter{
                font-size: 12px;
                padding:  2px 10px;
                color: #333;
                border-radius: 40px;
                display:  inline-block;
                border:  1px solid #ddd;
                vertical-align: middle;
            }
            .cmt-content {
                margin-bottom: 10px;
                font-size: 14px;
                margin-left: 103px;
            }
            .cmt-item:last-child{
                margin-bottom: 0;
                padding-bottom: 0;
                border: none;
            }
            .content {
                position: relative;
                z-index:  5;
            }

            .new-comments .inner {
                margin-left: 10px;
                margin-right: 5px;
            }
            .cmt-user-name {
                margin-bottom: 5px;
                padding-top: 5px;
            }
            .footer{
                position:  relative;
                z-index: 5;
                padding: 0;
                color: #fff;
                font-size: 14px;
            }
            .footer .row{
                padding: 0 20px;
                margin: auto;
                height: 100%;
            }

            p {
                margin: 0 0 4px;
            }
            .footer{
                background-color: lightpink;
            }
            .footer .row p
            {
                padding-left: 450px;
            }
            .footer .row a {
                font-weight:  bold;
                color:  white;
            }
            #loginbutton{
                padding-right: 94px;
                display:none;
            }
            .user-avatar {
                margin-left: 2px;
                margin-top: 1px;
                width: 30px;
                height: 30px;
                border-radius: 4px;
            }
            .m-wrap{
                width:160px;
                height:80px;
            }
            .m-chapters span {
                margin-right: 12px;
            }
             
            .m-wrap .m-title {
                text-align: center;
            }


        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="header" id='header'>
                <div class="inner-header" style="top: 0px">
                    <div class="row_clearfix">
                        <div class="logo" >
                            <a href="${pageContext.request.contextPath}/home"><img src="pages/AAAAAAA.png" width="180px" height="40px"></a>
                        </div>
                        <div class="nav">
                            <ul class="clearfix">
                                <li><a title="Mới cập nhật" href="#">Mới cập nhật</li>
                                <li>
                                    <a title="Thể loại " href="#" onclick="HienthiSearchTruyen()">Thể loại
                                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="284.929px" height="284.929px" viewBox="0 0 284.929 284.929" style="enable-background:new 0 0 284.929 284.929;" xml:space="preserve"> <g> <path d="M282.082,76.511l-14.274-14.273c-1.902-1.906-4.093-2.856-6.57-2.856c-2.471,0-4.661,0.95-6.563,2.856L142.466,174.441 L30.262,62.241c-1.903-1.906-4.093-2.856-6.567-2.856c-2.475,0-4.665,0.95-6.567,2.856L2.856,76.515C0.95,78.417,0,80.607,0,83.082 c0,2.473,0.953,4.663,2.856,6.565l133.043,133.046c1.902,1.903,4.093,2.854,6.567,2.854s4.661-0.951,6.562-2.854L282.082,89.647 c1.902-1.903,2.847-4.093,2.847-6.565C284.929,80.607,283.984,78.417,282.082,76.511z"></path> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg>								
                                </li>
                                <li>
                                    <a href="#" title="Truyện đang theo dõi"> Truyện đang theo dõi </a>
                                </li>
                        </div>



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
                        <c:if test="${sessionScope.userLogged != null}">
                            <div class="user-menu">
                                <a href="#" onclick="clickUser()">
                                    <img class="user-avatar" src="pages/images/avatar-meo-con-khung-long.jpg" alt="user avatar" width="18" height="18">	
                                </a>		

                                <div class="login" id="loginbutton"> 

                                    <div class="login kkk"><a href="${pageContext.request.contextPath}/pages/profile.jsp" id="sss">${username}</a></div>

                                    <div class="login sss"> <a href="${pageContext.request.contextPath}/logout" id="kkk">Đăng xuất</a> </div>


                                </div>
                            </div>
                        </c:if>


                        <div class="search-box">

                            <form method="get" action="textsearch">
                                <div class="search-wrapper">
                                    <input type="text" name="search-input" placeholder="Nhập tên truyện...">
                                    <button> 
                                        <svg fill="#000" height="16px" width="16px" version="1.1" 
                                             xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
                                             x="0px" y="0px" viewBox="0 0 513.28 513.28" xml:space="preserve">
                                        <path d="M495.04,404.48L410.56,320c15.36-30.72,25.6-66.56,25.6-102.4C436.16,97.28,338.88,0,218.56,0S0.96,97.28,0.96,217.6 s97.28,217.6,217.6,217.6c35.84,0,71.68-10.24,102.4-25.6l84.48,84.48c25.6,25.6,64,25.6,89.6,0 C518.08,468.48,518.08,430.08,495.04,404.48z M218.56,384c-92.16,0-166.4-74.24-166.4-166.4S126.4,51.2,218.56,51.2 s166.4,74.24,166.4,166.4S310.72,384,218.56,384z"></path></svg> </button>
                                </div>	

                            </form>
                        </div>	



                    </div>



                </div>


            </div> 
            <br/>
            <div class='wrapper-body'>	
                <div class="wrapper-body inner">
                    <div id="category" class="wrapper-body inner search-input">
                        <form method="GET" action="mutisearch">
                            <div > 

                                <input type="checkbox" name="category" value="0">All
                                <c:forEach items="${categories}" var="c">


                                    <input type="checkbox" name="category" value="${c.getId()}">${c.getCatname()}


                                </c:forEach>	
                            </div>
                            <button>Search</button>
                        </form>
                    </div>	
                    <div class="row_clearfix content-inner" style="height: auto !important;">
                        <div class="container-fluid">
                            <div class="page-h1">
                                <h1>Realove Manga - Đọc truyện tranh online</h1>
                            </div>
                            <div class="row">

                                <div class="col-lg-8 col-left" height: auto !important >
                                    <div class="pda manga-list clearfix">
                                        <div class="box-title">
                                            <h2>Tất cả truyện tranh > </h2>							
                                        </div>


                                    </div>

                                    <div class="pda manga-list clearfix">
                                        <c:forEach items="${requestScope.list}" var="c">
                                            <div class="m-item">
                                                <div class="m-img">
                                                    <a href="displaycomic?cid=${c.cid}" title="${c.cname}">
                                                        <img src="pages/images/${c.cimage}">
                                                    </a>
                                                </div>
                                                <div class="m-wrap">
                                                    <div class="m-title">
                                                        <a href="displaycomic?cid=${c.cid}" title="${c.cname}">${c.cname}</a>
                                                    </div>
                                                    <div class="m-chapters">
                                                        <ul>
                                                             <c:forEach items="${requestScope.chapterlastest}" var="chap">

                                                           
                                                            <c:if test="${chap.getComic().getCid() == c.cid}"> 
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/displayimage?chapid=${chap.chapid}&&cid=${c.cid}" title="${chap.chapname}">${chap.chapname}</a>
                                                                <span>${chap.publicdate}</span>
                                                            </li>
                                                                </c:if>
                                                        </c:forEach>

                                                           
                                                        </ul>	
                                                    </div>
                                                </div>



                                            </div>
                                        </c:forEach>


                                    </div>



                                </div><!-- comment -->











                                <div class="col-lg-4 col-right" height: auto !important >
                                    <div class="box-title h-title">
                                        <h2>
                                            Truyện theo dõi>>
                                        </h2>
                                        <a href="#" id="aaaa" style="
                                           float: right;
                                           text-transform: none;
                                           font-size: 14px;
                                           margin-top: -39px;
                                           ">Xem tất cả&gt;&gt;&gt;</a>
                                    </div>
                                    <div class="history xemganday">
                                        <ul class="clearfix"> 
                                            <div class='r-img'>
                                                <a title="Manh Thê Không Dễ Chọc" href="#">
                                                    <img src="http://otruyentranh.com/img/275/1080x1440-manh-the-khong-de-choc.jpeg" alt="Manh Thê Không Dễ Chọc" {$r_size}="">
                                                </a>
                                            </div>
                                            <div class='r-title'>
                                                <a href="#">Manh thê không dễ chọc </a>
                                            </div>
                                            <div class='r-chapter'>

                                                <a href="#" title="chapter 2">Chap mới nhất: chapter 2 </a>
                                            </div>




                                        </ul>




                                    </div>
                                    <div class="box-title">
                                        <h2> Xem nhiều>>
                                        </h2>
                                    </div>
                                    <div class="ranking xemnhieu"> 
                                        <ul class="clearfix">

                                            <li>  
                                                <div class="r-img">
                                                    <a title="gogo" href=#><img src="pages/images/avatar-meo-con-khung-long.jpg" title="ảnh">
                                                    </a>
                                                </div> 				
                                                <div class="r-title">
                                                    <a href="#" title="kaka">Ngôi sao trường Chohan </a>
                                                </div>				
                                                <div class="r-chapter">
                                                    <a href="#" title=" 92">Chapter 92</a>
                                                    <div class="r-views">
                                                        <img src="http://otruyentranh.com/public/icons/views.svg" alt="viewlogo" width="16" height="16">34565
                                                    </div>
                                                </div>
                                            </li>
                                            <li>  
                                                <div class="r-img">
                                                    <a title="gogo" href=#><img src="pages/images/avatar-meo-con-khung-long.jpg" title="ảnh">
                                                    </a>
                                                </div> 				
                                                <div class="r-title">
                                                    <a href="#" title="kaka">Ngôi sao trường Chohan </a>
                                                </div>				
                                                <div class="r-chapter">
                                                    <a href="#" title=" 92">Chapter 92</a>
                                                    <div class="r-views">
                                                        <img src="http://otruyentranh.com/public/icons/views.svg" alt="viewlogo" width="16" height="16">34565
                                                    </div>
                                                </div>
                                            </li>

                                        </ul>



                                    </div>
                                    <div class="box-title "><h2>Bình luận mới>></h2> </div>

                                    <div class="new-comments">
                                        <div class="new-comments inner">

                                            <c:forEach items="${requestScope.newcmt}" var="cmt">
                                            <div class="cmt-item clearfix">

                                                <a href="#">Kế hoạch định chế tình yêu</a> <br/>

                                                <div class="avatar">
                                                    <img src="pages/images/avatar-meo-con-khung-long.jpg" width="100" height="100">

                                                </div>
                                                <p class="cmt-user-name">
                                                    <span class="nickname" style="width:100px;">${cmt.user}</span>
                                                    <span class="cmt-chapter"><a href=""></a>Chapter 19</span>
                                                <p class="cmt-content"> ${cmt.comment}</p>
                                                </p>

                                            </div>
                                            </c:forEach>
                                           
                                        </div> 




                                    </div>



                                </div>










                            </div>
                        </div>
                    </div>


                </div>



            </div>
            <div class="footer">
                <div class="row clearfix">
                    <div>
                        <p><img src="" name="logo"></p>
                        <p><a href="homepage.html">Real love manga nơi làm rung động trái tim bạn như tình đầu </a></p>
                        <p>Copyright Gina_chan &emsp; Facebook: <a style="font-weight: normal" href="https://www.facebook.com/dang.vangiang.50">Roll Golden</a>&emsp; FPT University</p>
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
