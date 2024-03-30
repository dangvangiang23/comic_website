<%-- 
    Document   : readComic
    Created on : Jul 10, 2022, 11:03:19 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${tentruyen}</title>
        <link rel="icon" href="F:\279104338_529864098549019_8524712165045002861_n.jpg" sizes="16x16">
        <link rel="icon" href="F:\279104338_529864098549019_8524712165045002861_n.jpg" sizes="16x16">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="pages/readcomic.css"/>
       
    </head>
    <div class="wrapper">
        <jsp:include page="../pages/separate_page/header.jsp" />
        <br/>

        <div class='wrapper-body'>	
            <div class="wrapper-body inner">
                <div id="category" class="wrapper-body inner search-input">		
                    <form method="GET" action="multisearch">


                        <input type="checkbox" name="category" value="0"> All
                        <c:forEach items="${requestScope.categories}" var="c">


                            <input type="checkbox" name="category" value="${c.getId()}">
                            ${c.getCatname()}


                        </c:forEach>	

                        <button>Search</button>
                    </form>
                </div>
                <div class="content" >	
                    <div class="manga content-inner row clearfix" style="height: auto !important;">
                        <div class="breadcrumb-wrapper">

                            <div>	<a href="${pageContext.request.contextPath}/home" style="font-size:14px">Real love manga</a>/<a href="displaycomic?cid=${requestScope.comic.cid}">${requestScope.comic.cname}</a>  </div>

                        </div>
                        <h1 class="manga-title">${requestScope.comic.cname}</h1>
                        <div class="manga-body clearfix">
                            <div>
                                <div class="manga-img">
                                    <img src="pages/images/${requestScope.comic.cimage}"
                                         width="1820" height="2560">
                                </div>

                                <div class="manga-detail">
                                    <ul class="clearfix">
                                        <li>
                                            <div class="md-title"><i class="fa fa-user"></i> Tác giả :</div>
                                            <div class="md-content"><a title="${requestScope.comic.getAuthor().getAuthorname()}" href="${pageContext.request.contextPath}/authorsearch?authorid=${requestScope.comic.getAuthor().authorid}">
                                                                                ${requestScope.comic.getAuthor().getAuthorname()}</a></div>
                                        </li>

                                        <li>
                                            <div class="md-title"><i class="fa fa-rss"></i> 		Tình trạng :</div>
                                            <div class="md-content">${requestScope.comic. getStatus()}</div>
                                        </li>

                                        <li>
                                            <div class="md-title"><i class="fa fa-tags"></i> Thể loại :</div>


                                            <div class="md-content">
                                                <c:forEach items="${requestScope.cates}" var="c">
                                                    <a title="${c.getCatname()}" href="${pageContext.request.contextPath}/mutisearch?category=${c.id}">${c.getCatname()}&ensp;</a>
                                                </c:forEach>


                                            </div>


                                        </li>
                                        <li>
                                            <div class="md-title"><i class="fa fa-clock"></i> Cập nhật :</div>
                                            <div class="md-content">${requestScope.date}</div>
                                        </li>

                                        <li>
                                            <div class="md-title"><i class="fa fa-eye"></i> Lượt xem :</div>
                                            <div class="md-content">${requestScope.view}</div>
                                        </li>
                                    </ul>
                                </div>	 
                            </div>
                            <br/>
                            <div class="manga-actions">

                                <div> <a href="${pageContext.request.contextPath}/displayimage?chapid=${requestScope.chapbegin.getChapid()}&&cid=${requestScope.comic.cid}" title="Đọc từ đầu">Đọc từ đầu</a>
                                    <a href="${pageContext.request.contextPath}/displayimage?chapid=${requestScope.chapend.getChapid()}&&cid=${requestScope.comic.cid}" title="Chap mới nhất">Chap mới nhất</a>


                                    <a href="#" id="fav" title="Theo dõi" style="" class="">Theo dõi</a>
                                </div>

                            </div>
                            <div class="box-title _border" style="border-bottom: 2px solid;">
                                <h2><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 296.999 296.999" style="enable-background:new 0 0 296.999 296.999;" xml:space="preserve"><g><g><g><path d="M45.432,35.049c-0.008,0-0.017,0-0.025,0c-2.809,0-5.451,1.095-7.446,3.085c-2.017,2.012-3.128,4.691-3.128,7.543 v159.365c0,5.844,4.773,10.61,10.641,10.625c24.738,0.059,66.184,5.215,94.776,35.136V84.023c0-1.981-0.506-3.842-1.461-5.382 C115.322,40.849,70.226,35.107,45.432,35.049z"></path> <path d="M262.167,205.042V45.676c0-2.852-1.111-5.531-3.128-7.543c-1.995-1.99-4.639-3.085-7.445-3.085c-0.009,0-0.018,0-0.026,0 c-24.793,0.059-69.889,5.801-93.357,43.593c-0.955,1.54-1.46,3.401-1.46,5.382v166.779 c28.592-29.921,70.038-35.077,94.776-35.136C257.394,215.651,262.167,210.885,262.167,205.042z"></path> <path d="M286.373,71.801h-7.706v133.241c0,14.921-12.157,27.088-27.101,27.125c-20.983,0.05-55.581,4.153-80.084,27.344 c42.378-10.376,87.052-3.631,112.512,2.171c3.179,0.724,6.464-0.024,9.011-2.054c2.538-2.025,3.994-5.052,3.994-8.301V82.427 C297,76.568,292.232,71.801,286.373,71.801z"></path> <path d="M18.332,205.042V71.801h-7.706C4.768,71.801,0,76.568,0,82.427v168.897c0,3.25,1.456,6.276,3.994,8.301 c2.545,2.029,5.827,2.78,9.011,2.054c25.46-5.803,70.135-12.547,112.511-2.171c-24.502-23.19-59.1-27.292-80.083-27.342 C30.49,232.13,18.332,219.963,18.332,205.042z"></path></g></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>Nội dung</h2>
                            </div>
                            <div class="manga-description">
                                <div class="inner">${requestScope.comic.description}</div>
                            </div>
                            <div class="box-title _border" style="border-bottom: 2px solid;">
                                <h2><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="511.626px" height="511.626px" viewBox="0 0 511.626 511.626" style="enable-background:new 0 0 511.626 511.626;" xml:space="preserve"><g><g><path d="M63.953,164.453H9.135c-2.474,0-4.615,0.9-6.423,2.709C0.903,168.972,0,171.114,0,173.589v54.817 c0,2.473,0.903,4.619,2.712,6.424c1.809,1.803,3.949,2.712,6.423,2.712h54.818c2.474,0,4.615-0.905,6.423-2.712 c1.809-1.809,2.712-3.951,2.712-6.424v-54.817c0-2.475-0.904-4.617-2.712-6.427C68.568,165.356,66.427,164.453,63.953,164.453z"></path><path d="M63.953,383.722H9.135c-2.474,0-4.615,0.896-6.423,2.707C0.903,388.238,0,390.378,0,392.854v54.82 c0,2.471,0.903,4.609,2.712,6.42c1.809,1.813,3.949,2.714,6.423,2.714h54.818c2.474,0,4.615-0.903,6.423-2.714 c1.809-1.807,2.712-3.949,2.712-6.42v-54.82c0-2.477-0.904-4.616-2.712-6.426C68.568,384.625,66.427,383.722,63.953,383.722z"></path> <path d="M63.953,274.082H9.135c-2.474,0-4.615,0.91-6.423,2.714S0,280.749,0,283.22v54.815c0,2.478,0.903,4.62,2.712,6.427 c1.809,1.808,3.949,2.707,6.423,2.707h54.818c2.474,0,4.615-0.896,6.423-2.707c1.809-1.807,2.712-3.949,2.712-6.427V283.22 c0-2.471-0.904-4.613-2.712-6.424C68.568,274.989,66.427,274.082,63.953,274.082z"></path><path d="M63.953,54.817H9.135c-2.474,0-4.615,0.903-6.423,2.712S0,61.479,0,63.953v54.817c0,2.475,0.903,4.615,2.712,6.424 s3.949,2.712,6.423,2.712h54.818c2.474,0,4.615-0.9,6.423-2.712c1.809-1.809,2.712-3.949,2.712-6.424V63.953 c0-2.475-0.904-4.615-2.712-6.424C68.568,55.725,66.427,54.817,63.953,54.817z"></path><path d="M502.49,383.722H118.771c-2.474,0-4.615,0.896-6.423,2.707c-1.809,1.81-2.712,3.949-2.712,6.426v54.82 c0,2.471,0.903,4.609,2.712,6.42c1.809,1.813,3.946,2.714,6.423,2.714H502.49c2.478,0,4.616-0.903,6.427-2.714 c1.81-1.811,2.71-3.949,2.71-6.42v-54.82c0-2.477-0.903-4.616-2.71-6.426C507.106,384.625,504.967,383.722,502.49,383.722z"></path> <path d="M502.49,274.082H118.771c-2.474,0-4.615,0.91-6.423,2.714s-2.712,3.953-2.712,6.424v54.815 c0,2.478,0.903,4.62,2.712,6.427c1.809,1.808,3.946,2.707,6.423,2.707H502.49c2.478,0,4.616-0.896,6.427-2.707 c1.81-1.807,2.71-3.949,2.71-6.427V283.22c0-2.471-0.903-4.613-2.71-6.424C507.106,274.992,504.967,274.082,502.49,274.082z"></path> <path d="M508.917,57.529c-1.811-1.805-3.949-2.712-6.427-2.712H118.771c-2.474,0-4.615,0.903-6.423,2.712 s-2.712,3.949-2.712,6.424v54.817c0,2.475,0.903,4.615,2.712,6.424s3.946,2.712,6.423,2.712H502.49c2.478,0,4.616-0.9,6.427-2.712 c1.81-1.809,2.71-3.949,2.71-6.424V63.953C511.626,61.479,510.723,59.338,508.917,57.529z"></path><path d="M502.49,164.453H118.771c-2.474,0-4.615,0.9-6.423,2.709c-1.809,1.81-2.712,3.952-2.712,6.427v54.817 c0,2.473,0.903,4.615,2.712,6.424c1.809,1.803,3.946,2.712,6.423,2.712H502.49c2.478,0,4.616-0.905,6.427-2.712 c1.81-1.809,2.71-3.951,2.71-6.424v-54.817c0-2.475-0.903-4.617-2.71-6.427C507.106,165.356,504.967,164.453,502.49,164.453z"></path></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>Danh sách chương</h2>
                            </div>
                            <!--<!-- o day se hien thi cac chapter kem theo chapid cua no -->

                            <div class="manga-chapters">
                                <ul class="clearfix">
                                    <li class="thead">
                                        <div class="col-60 ">Số chương</div>
                                        <div class="col-20 ct">Lượt xem</div>
                                        <div class="col-20 alr">Cập nhật</div>
                                    </li>
                                    <c:forEach items="${requestScope.chapters}" var="c">
                                        <li>
                                            <div class="col-60 "><a title="${c.getChapname()}" href="${pageContext.request.contextPath}/displayimage?chapid=${c.getChapid()}&&cid=${requestScope.comic.cid}">${c.getChapname()}</a></div>
                                            <div class="col-20 ct">${c.view}</div>
                                            <div class="col-20 ct" style="text-align: left">${c.getPublicdate()}</div>

                                        </li>  
                                     </c:forEach>
                                    </ul>
                                </div>
                            
                            <div class="comment-box" id="comment-box">
                                <div class="box-title _border" style="border-bottom: 2px solid;">
                                    <h2><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="511.626px" height="511.626px" viewBox="0 0 511.626 511.626" style="enable-background:new 0 0 511.626 511.626;" xml:space="preserve"> <g> <g> <path d="M301.927,327.605c30.926-13.038,55.34-30.785,73.23-53.248c17.888-22.458,26.833-46.915,26.833-73.372 c0-26.458-8.945-50.917-26.84-73.376c-17.888-22.459-42.298-40.208-73.228-53.249c-30.93-13.039-64.571-19.556-100.928-19.556 c-36.354,0-69.995,6.521-100.927,19.556c-30.929,13.04-55.34,30.789-73.229,53.249C8.947,150.072,0,174.527,0,200.986 c0,22.648,6.767,43.975,20.28,63.96c13.512,19.981,32.071,36.829,55.671,50.531c-1.902,4.572-3.853,8.754-5.852,12.566 c-2,3.806-4.377,7.467-7.139,10.991c-2.76,3.525-4.899,6.283-6.423,8.275c-1.523,1.998-3.997,4.812-7.425,8.422 c-3.427,3.617-5.617,5.996-6.567,7.135c0-0.191-0.381,0.24-1.143,1.287c-0.763,1.047-1.191,1.52-1.285,1.431 c-0.096-0.103-0.477,0.373-1.143,1.42c-0.666,1.048-1,1.571-1,1.571l-0.715,1.423c-0.282,0.575-0.476,1.137-0.57,1.712 c-0.096,0.567-0.144,1.19-0.144,1.854s0.094,1.28,0.288,1.854c0.381,2.471,1.475,4.466,3.283,5.996 c1.807,1.52,3.756,2.279,5.852,2.279h0.857c9.515-1.332,17.701-2.854,24.552-4.569c29.312-7.61,55.771-19.797,79.372-36.545 c17.129,3.046,33.879,4.568,50.247,4.568C237.353,347.16,270.998,340.645,301.927,327.605z"></path> <path d="M491.354,338.166c13.518-19.889,20.272-41.247,20.272-64.09c0-23.414-7.146-45.316-21.416-65.68 c-14.277-20.362-33.694-37.305-58.245-50.819c4.374,14.274,6.563,28.739,6.563,43.398c0,25.503-6.368,49.676-19.129,72.519 c-12.752,22.836-31.025,43.01-54.816,60.524c-22.08,15.988-47.205,28.261-75.377,36.829 c-28.164,8.562-57.573,12.848-88.218,12.848c-5.708,0-14.084-0.377-25.122-1.137c38.256,25.119,83.177,37.685,134.756,37.685 c16.371,0,33.119-1.526,50.251-4.571c23.6,16.755,50.06,28.931,79.37,36.549c6.852,1.718,15.037,3.237,24.554,4.568 c2.283,0.191,4.381-0.476,6.283-1.999c1.903-1.522,3.142-3.61,3.71-6.272c-0.089-1.143,0-1.77,0.287-1.861 c0.281-0.09,0.233-0.712-0.144-1.852c-0.376-1.144-0.568-1.715-0.568-1.715l-0.712-1.424c-0.198-0.376-0.52-0.903-0.999-1.567 c-0.476-0.66-0.855-1.143-1.143-1.427c-0.28-0.284-0.705-0.763-1.28-1.424c-0.568-0.66-0.951-1.092-1.143-1.283 c-0.951-1.143-3.139-3.521-6.564-7.139c-3.429-3.613-5.899-6.42-7.422-8.418c-1.523-1.999-3.665-4.757-6.424-8.282 c-2.758-3.518-5.14-7.183-7.139-10.991c-1.998-3.806-3.949-7.995-5.852-12.56C459.289,374.859,477.843,358.062,491.354,338.166z"></path> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg>Bình luận</h2>
                                </div>
                                <div class="comment-area">
                                    <form method="POST">
                                        <textarea id="comment-content" aria-label="comment"></textarea>
                                        <button>Send</button>
                                    </form>

                                </div>

                            </div>

                            <div class="list-cmt" id="list-cmt">

                                <div> Ginachan:    aaaaaaaaaaaaaaaaaaaaaaa  	</div>

                            </div>




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
