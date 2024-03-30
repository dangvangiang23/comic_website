<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 3/30/2024
  Time: 6:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="header" id='header'>
    <div class="inner-header" style="top: 0px">
        <div class="row_clearfix">
            <div class="logo" >
                <a href="${pageContext.request.contextPath}"><img src="pages/AAAAAAA.png" width="180px" height="40px"></a>
            </div>
            <div class="nav">
                <ul class="clearfix">
                    <li><a title="Mới cập nhật" href="#"> </a> Mới cập nhật </li>
                    <li>
                        <a title="Thể loại " href="#" onclick="HienthiSearchTruyen()">Thể loại
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="284.929px" height="284.929px" viewBox="0 0 284.929 284.929" style="enable-background:new 0 0 284.929 284.929;" xml:space="preserve"> <g> <path d="M282.082,76.511l-14.274-14.273c-1.902-1.906-4.093-2.856-6.57-2.856c-2.471,0-4.661,0.95-6.563,2.856L142.466,174.441 L30.262,62.241c-1.903-1.906-4.093-2.856-6.567-2.856c-2.475,0-4.665,0.95-6.567,2.856L2.856,76.515C0.95,78.417,0,80.607,0,83.082 c0,2.473,0.953,4.663,2.856,6.565l133.043,133.046c1.902,1.903,4.093,2.854,6.567,2.854s4.661-0.951,6.562-2.854L282.082,89.647 c1.902-1.903,2.847-4.093,2.847-6.565C284.929,80.607,283.984,78.417,282.082,76.511z"></path> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg>
                        </a>
                    </li>
                    <li>
                        <a href="#" title="Truyện đang theo dõi"> Truyện đang theo dõi </a>
                    </li>
                </ul>
            </div>



            <c:if test="${sessionScope.userLogged == null}">
                <div class="user-menu" onclick="clickUser()">
                    <a href="#" >
                        <img class="user-avatar" src="pages/avatar-meo-con-khung-long.jpg" alt="user avatar" width="18" height="18">
                    </a>

                    <div class="login" id="">

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

                        <div class="login kkk"><a href="${pageContext.request.contextPath}/pages/profile.jsp" >${username}</a></div>

                        <div class="login sss"> <a href="${pageContext.request.contextPath}/logout" >Đăng xuất</a> </div>


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