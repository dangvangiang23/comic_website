<%-- 
    Document   : trangtruyen
    Created on : Jul 11, 2022, 1:33:23 PM
    Author     : MSI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Reallove manga</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="pages/homepage.css"/>
        <link rel="stylesheet" href="pages/trangtruyen.css"/>
        <style>
            .chapter-title {
                font-size: 24px;
                text-align: center;
                width: 100%;
                margin-bottom: 20px;
                margin-top: 0px;
            }
            .ft-btn {
                width: 100px;
                height: 30px;
                border-radius: 5px;
                background-color: darkorange;
                /* color: white; */
                text-align: center;
                color: white;
                margin-top: 10px;
                margin-bottom: 5px;
            }
            .cmt-item:last-child {
                margin-bottom: 0;
                padding-bottom: 0;
                border: none;
                margin-bottom: 50px;
            }
            select {
                width: 100px;
                height: 30px;
                text-align: center;
                background-color: lightpink;
                color: white;
                border-radius: 5px;
                border: none;
            }
        </style>

    </head>
    <body>

    <center>
        <div class="wrapper">
            <jsp:include page="../pages/separate_page/header.jsp" />
            <br/>
            <div class='wrapper-body'>	
                <div class="wrapper-body inner">

                    <div class="row chapter-wrap-box" style="height:auto !important;">


                        <div class="breadcrumb">
                            <a href="${pageContext.request.contextPath}/home">Real love manga</a>/
                            <a href="displaycomic?cid=${requestScope.comic2.cid}">${requestScope.comic2.cname}</a>
                            /<a href="#">${requestScope.chapter.chapname} </a>
                        </div>
                        <h1 class="chapter-title">${requestScope.chapter.chapname}</h1>
                        <div><a title="Bao loi" href="https://www.facebook.com/dang.vangiang.50/" style="color:red">Báo lỗi</a></div>

                        <form id="f1" action="navchap">
                            <select style="float:right; margin-left:-95px" name="chapter-navbar" onchange="change()">   
                                <option>Chọn chap </option>
                                <c:forEach items="${requestScope.chapters}" var="c"> 
                                    <option value="${c.chapid}"> ${c.chapname} </option>
                                </c:forEach>
                            </select>
                        </form>

                            <div class="inner">

                                <c:if test="${requestScope.chapter.chapid eq requestScope.chapters.get(0).chapid}">
                                    <div class="ft-btn " style="display: inline-block">
                                        <a href="displayimage?chapid=${requestScope.chapidnext}&&cid=${requestScope.comic2.cid}">Chap sau</a>
                                    </div>
                                </c:if>

                                <c:if test="${requestScope.chapter.chapid eq requestScope.chapters.get(requestScope.chapters.size()-1).chapid}">
                                    <div class="ft-btn" style="display: inline-block">
                                        <a href="displayimage?chapid=${requestScope.chapidprevious}&&cid=${requestScope.comic2.cid}" >Chap trước</a>
                                    </div>
                                </c:if>

                                <c:if test="${(requestScope.chapter.chapid ne requestScope.chapters.get(0).chapid) &&(requestScope.chapter.chapid ne requestScope.chapters.get(requestScope.chapters.size()-1).chapid)}">


                                    <div class="ft-btn" style="display: inline-block">
                                        <a href="displayimage?chapid=${requestScope.chapidprevious}&&cid=${requestScope.comic2.cid}" >Chap trước</a>
                                    </div>
                                    <div class="ft-btn " style="display: inline-block">
                                        <a href="displayimage?chapid=${requestScope.chapidnext}&&cid=${requestScope.comic2.cid}">Chap sau</a>
                                    </div>
                                </c:if>


                            </div>




                        <div class="chapters">
                            <c:forEach items="${requestScope.urlimgs}" var="u">

                                <div>
                                    <div class="chapter-img">
                                        <img class="lazy entered loaded" src="pages/images/${u}">
                                    </div>
                                </div>
                            </c:forEach>



                        </div>


                        <div class="row chapter-wrap-box">
                            <div class="ft-chapter">
                                <div class="inner">

                                    <c:if test="${requestScope.chapter.chapid eq requestScope.chapters.get(0).chapid}">
                                        <div class="ft-btn " style="display: inline-block">
                                            <a href="displayimage?chapid=${requestScope.chapidnext}&&cid=${requestScope.comic2.cid}">Chap sau</a>                                         
                                        </div>
                                    </c:if>

                                    <c:if test="${requestScope.chapter.chapid eq requestScope.chapters.get(requestScope.chapters.size()-1).chapid}">
                                        <div class="ft-btn" style="display: inline-block">                                   
                                            <a href="displayimage?chapid=${requestScope.chapidprevious}&&cid=${requestScope.comic2.cid}" >Chap trước</a>
                                        </div>
                                    </c:if> 
                                    
                                    <c:if test="${(requestScope.chapter.chapid ne requestScope.chapters.get(0).chapid) &&(requestScope.chapter.chapid ne requestScope.chapters.get(requestScope.chapters.size()-1).chapid)}">

                                       
                                        <div class="ft-btn" style="display: inline-block">                                   
                                            <a href="displayimage?chapid=${requestScope.chapidprevious}&&cid=${requestScope.comic2.cid}" >Chap trước</a>
                                        </div>
                                         <div class="ft-btn " style="display: inline-block">
                                            <a href="displayimage?chapid=${requestScope.chapidnext}&&cid=${requestScope.comic2.cid}">Chap sau</a>                                         
                                        </div>
                                    </c:if> 






                                    <div>   <a href="#" style="float: right;background-color: lightblue;border-radius: antiquewhite;border-radius: 3px;height: 27px;color: steelblue;color: bacl;"> 
                                            Lên đầu trang </a>



                                    </div>

                                </div>


                            </div>

                            <div class="comment-box" id="comment-box">
                                <div class="box-title _border" style="border-bottom: 2px solid;">
                                    Comment: 
                                </div>
                                <div class="row chapter-wrap-box clearfix">

                                    <div class="comment-area">
                                        <form method="GET" action="addcomment">
                                            User <input style="width:60px;overflow:hidden;margin-bottom: 10px" type="text" name="user">
                                            <textarea id="comment-content" aria-label="comment" name="textarea"></textarea>
                                            <input style="display:none" name="laydata" value="${requestScope.chapter.chapid}">
                                            <input style="display:none" name="laydata2" value="${requestScope.comic2.cid}">
                                            <button>Send</button>
                                        </form>
                                        <div> ${requestScope.message} </div>

                                    </div>


                                    <div class="list-cmt" id="list-cmt" style="width: auto">
                                        <c:forEach items="${requestScope.commentss}" var="com"> 
                                            <div class="cmt-item clearfix" data-cmt-id="249">
                                                <div class="avatar">
                                                    <img alt="user avatar" src="pages/avatar-meo-con-khung-long.jpg">
                                                </div>

                                                <p class="cmt-user-name">
                                                    <span class="nickname">${com.user}</span>

                                                </p>

                                                <p class="cmt-content">                                              
                                                <div style="
                                                     margin-left: -355px;
                                                     width: 600px;
                                                     height: 50px;
                                                     ">${com.comment}
                                                </div>
                                                </p>
                                            </div>
                                        </c:forEach> 
                                    </div>


                                </div>
                            </div>


                        </div>

                    </div>
                </div>
                </center>

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
                    function change()
                    {
                        document.getElementById("f1").submit();

                    }

                </script>

                </body>
                </html>