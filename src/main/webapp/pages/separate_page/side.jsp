<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 3/30/2024
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
                    <img src="https://bizweb.dktcdn.net/100/438/408/files/truyen-tranh-ngon-tinh-hoc-duong-yodyvn4.jpg?v=1692930403050" alt="Manh Thê Không Dễ Chọc" {$r_size}="">
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
                    <a title="gogo" href=#><img src="https://bloganchoi.com/wp-content/uploads/2020/06/truyen-tranh-cua-hwang-mi-ri-5-b.jpg" title="ảnh">
                    </a>
                </div>
                <div class="r-title">
                    <a href="#" title="kaka">Ngôi sao trường Chohan </a>
                </div>
                <div class="r-chapter">
                    <a href="#" title=" 92">Chapter 92</a>
                    <div class="r-views">
                        <img src="https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2ZyY2l0eV9hcnRpc3RpY19hcmNoaXRlY3R1cmVfdG91cmlzbS1pbWFnZS1qb2I4NDkucG5n.png" alt="viewlogo" width="16" height="16">34565
                    </div>
                </div>
            </li>
            <li>
                <div class="r-img">
                    <a title="gogo" href=#><img src="https://bloganchoi.com/wp-content/uploads/2023/04/truyen-tranh-xuyen-khong-hay-full-14-696x800.jpg" title="ảnh">
                    </a>
                </div>
                <div class="r-title">
                    <a href="#" title="kaka">Phù thủy xứ Ai Cập</a>
                </div>
                <div class="r-chapter">
                    <a href="#" title=" 92">Chapter 92</a>
                    <div class="r-views">
                        <img src="https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2ZyY2l0eV9hcnRpc3RpY19hcmNoaXRlY3R1cmVfdG91cmlzbS1pbWFnZS1qb2I4NDkucG5n.png" alt="viewlogo" width="16" height="16">34565
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
