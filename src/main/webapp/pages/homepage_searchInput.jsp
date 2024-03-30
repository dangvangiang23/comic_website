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
                                    <img class="user-avatar" src="pages/avatar-meo-con-khung-long.jpg" alt="user avatar" width="18" height="18">	
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
                        <form method="POST" action="multisearch">
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

                                    <div class="box-title">
                                        <h2>${search} > </h2>							
                                    </div>
                                    <c:if test="${requestScope.comics != null}">
                                        <div class="pda manga-list clearfix">
                                            <c:forEach items="${requestScope.comics}" var="c">
                                                <div class="m-item">
                                                    <div class="m-img">
                                                        <a href="/DisplayChapterController?cid=${c.cid}" title="${c.cname}"> 
                                                            <img src="pages/${cimage}}">
                                                        </a>
                                                    </div>
                                                    <div class="m-wrap">
                                                        <div class="m-title">
                                                            <!--  private int cid ;
         private String cname ;
         private String description ;
         private String cimage;
         private Author author;
         private String status ;
         private ArrayList<Category> categories ; -->
                                                            <a href="/DisplayChapterController?cid=${c.cid}" title="${c.cname}">${c.cname}</a>
                                                        </div>
                                                        <div class="m-chapters">
                                                            <ul>
                                                                <li>
                                                                    <a href="#">Chapter 6.2</a>
                                                                    <span>3 gio truoc</span>
                                                                </li>
                                                                <li>
                                                                    <a href="#">Chapter 6.2</a>
                                                                    <span>1 ngay truoc</span>							
                                                                </li>
                                                            </ul>	
                                                        </div>
                                                    </div>



                                                </div>
                                            </c:forEach>


                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.comics == null}">

                                        <div style="margin-top: 20px"> Rất tiếc, không có kết quả cho tìm kiếm ${sessionScope.text-input} </div>



                                    </c:if>

                                </div>

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
                                                <a title="Manh Thê Không Dễ Chọc" href="/manga/manh-the-khong-de-choc-275">
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
                                                    <a title="gogo" href=#><img src="pages/1858x2560-ke-hoach-dinh-che-tinh-yeu.jpeg" title="ảnh">
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
                                                    <a title="gogo" href=#><img src="pages/1858x2560-ke-hoach-dinh-che-tinh-yeu.jpeg" title="ảnh">
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

                                            <div class="cmt-item clearfix">

                                                <a href="#">Kế hoạch định chế tình yêu</a> <br/>

                                                <div class="avatar">
                                                    <img src="pages/avatar-meo-con-khung-long.jpg" width="100" height="100">

                                                </div>
                                                <p class="cmt-user-name">
                                                    <span class="nickname">Ginachan</span>
                                                    <span class="cmt-chapter"><a href="">Chapter 19</a></span>
                                                <p class="cmt-content"> Đẹp trai con giai </p>
                                                </p>

                                            </div>
                                            <div class="cmt-item clearfix">

                                                <a href="#">Kế hoạch định chế tình yêu</a> <br/>

                                                <div class="avatar">
                                                    <img src="pages/avatar-meo-con-khung-long.jpg" width="100" height="100">

                                                </div>
                                                <p class="cmt-user-name">
                                                    <span class="nickname">Ginachan</span>
                                                    <span class="cmt-chapter"><a href="">Chapter 19</a></span>
                                                <p class="cmt-content"> Đẹp trai con giai </p>
                                                </p>

                                            </div>
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
