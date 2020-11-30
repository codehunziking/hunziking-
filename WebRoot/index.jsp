<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet">
<script src="js/owl/owl.carousel.min.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container wow lightSpeedIn" id="banner12" data-wow-duration="1.4s" data-wow-delay="0s"
         data-wow-iteration="1">
        <div class="swiper-wrapper">
            <% for (HashMap bht : bhtList) { %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>"
                       style="background-image: url('<%= bht.get("image") %>'); height: 380px"></a>
                </div>
            </div>
            <% } %>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>


    <script data-wow-duration="1.4s" data-wow-delay="0s" data-wow-iteration="1" class="wow lightSpeedIn">
        var mySwiper = new Swiper('#banner12', {
            loop: true, // 循环模式选项
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            },
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
            // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        })
    </script>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-modelbox-widget wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0s"
                     data-wow-iteration="1"
                     style="margin:35px 0 0 0;background-color:#FFFFFF;box-shadow:0px 0px 10px 3px #7E7E7E">
                    <h3 class="section-title">
                        <div class="more">
                            <a href="shangpinxinxilist.jsp">更多>></a>
                        </div>
                        销量榜单
                    </h3>
                    <div class="sidebar-widget-body">


                        <div class="shop-product-xz">
                            <% ArrayList<HashMap> shangpinxinxilist16 = Query.make("shangpinxinxi").limit(4).order("xiaoliang desc").select(); %>
                            <div class="clearfix">
                                <% for (HashMap r : shangpinxinxilist16) { %>
                                <div class="products-col" style="width: 25%">
                                    <article class="single_product">
                                        <figure>
                                            <div class="product_thumb">
                                                <a class="primary_img img-box pb100 img-scale"
                                                   href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                    <div class="img"
                                                         style="background-image: url('<%= Info.images(r.get("tupian")) %>')">
                                                        <img src="<%= Info.images(r.get("tupian")) %>" alt=""/>
                                                    </div>
                                                </a>
                                            </div>
                                            <figcaption class="product_content">
                                                <h4 class="product_name">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("mingcheng") %>
                                                    </a>
                                                </h4>
                                                <div class="price_box">
                                                    <span class="current_price">价格<%= r.get("jiage") %></span>
                                                </div>
                                                <div class="add_to_cart">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       title="查看详情">查看详情</a>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-modelbox-widget wow fadeInUpBig" data-wow-duration="1s" data-wow-delay="0s"
                     data-wow-iteration="1"
                     style="margin:35px 0 0 0;background-color:#FFFFFF;box-shadow:0px 0px 10px 3px #7E7E7E">
                    <h3 class="section-title">
                        <div class="more">
                            <a href="shangpinxinxilist.jsp">更多>></a>
                        </div>
                        店长推荐
                    </h3>
                    <div class="sidebar-widget-body">


                        <div class="shop-product-xz">
                            <% ArrayList<HashMap> shangpinxinxilist21 = Query.make("shangpinxinxi").where("shifoutuijian", "是").limit(4).order("id desc").select(); %>
                            <div class="clearfix">
                                <% for (HashMap r : shangpinxinxilist21) { %>
                                <div class="products-col" style="width: 25%">
                                    <article class="single_product">
                                        <figure>
                                            <div class="product_thumb">
                                                <div class="label_product">
                                                    <% if (r.get("shifoutuijian").equals("是")) { %>
                                                    <span class="label_sale">推荐</span>
                                                    <% } %>
                                                </div>
                                                <a class="primary_img img-box pb100 img-scale"
                                                   href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                    <div class="img"
                                                         style="background-image: url('<%= Info.images(r.get("tupian")) %>')">
                                                        <img src="<%= Info.images(r.get("tupian")) %>" alt=""/>
                                                    </div>
                                                </a>
                                            </div>
                                            <figcaption class="product_content">
                                                <h4 class="product_name">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("mingcheng") %>
                                                    </a>
                                                </h4>
                                                <div class="price_box">
                                                    <span class="current_price">价格<%= r.get("jiage") %></span>
                                                </div>
                                                <div class="add_to_cart">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       title="查看详情">查看详情</a>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>