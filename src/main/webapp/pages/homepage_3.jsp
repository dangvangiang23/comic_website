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
            <jsp:include page="../pages/separate_page/header.jsp" />
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
                                        <c:forEach items="${requestScope.comicauthor}" var="c">
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




                                <!-- comment -->
                                <jsp:include page="../pages/separate_page/side.jsp" />



                            </div>
                        </div>
                    </div>


                </div>



            </div>
            <jsp:include page="../pages/separate_page/footer.jsp" />
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
