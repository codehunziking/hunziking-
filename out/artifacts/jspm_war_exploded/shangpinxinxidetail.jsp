<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
    new CommDAO().commOper("INSERT INTO liulanjilu(shangpinxinxiid,shangpinbianhao,mingcheng,fenlei,pinpai,jiage,liulanren)   SELECT id,shangpinbianhao,mingcheng,fenlei,pinpai,jiage,'" + request.getSession().getAttribute("username") + "'   FROM shangpinxinxi   WHERE id='" + request.getParameter("id") + "' AND 'null'!='" + request.getSession().getAttribute("username") + "'");

%>
<% HashMap map = Query.make("shangpinxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-modelbox-widget" style="margin:35px  0 0 0 ;background-color:#FFFFFF">
                    <h3 class="section-title">
                        商品详情 </h3>
                    <div class="sidebar-widget-body">


                        <div class="">
                            <div class="goods-info clearfix">
                                <div class="gallery-list">
                                    <div class="swiper-container gallery-top" id="shangpin-galler">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                    <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                </div>
                                <div class="goods-right-content">
                                    <h3 class="title"><%= map.get("mingcheng") %>
                                    </h3>
                                    <div class="descount">
                                        <div>
                        <span class="name">
                            商品编号：
                        </span>
                                            <span class="val">
                            <%= map.get("shangpinbianhao") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            品牌：
                        </span>
                                            <span class="val">
                            <%= map.get("pinpai") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            分类：
                        </span>
                                            <span class="val">
                            <%
                                HashMap mapfenlei5 = new CommDAO().find("SELECT fenleimingcheng FROM fenlei where id='" + map.get("fenlei") + "'");
                            %><%= mapfenlei5.get("fenleimingcheng") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            销量：
                        </span>
                                            <span class="val">
                            <%= map.get("xiaoliang") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            库存：
                        </span>
                                            <span class="val">
                            <%= map.get("kucun") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            价格：
                        </span>
                                            <span class="val">
                            <%= map.get("jiage") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            规格：
                        </span>
                                            <span class="val">
                            <%= map.get("guige") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            是否推荐：
                        </span>
                                            <span class="val">
                            <%= map.get("shifoutuijian") %>                        </span>
                                        </div>
                                    </div>

                                    <% HashMap readMap = Query.make("shangpinxinxi").where("id", request.getParameter("id")).find(); %>
                                    <form class="form-inline" action="gouwulan.jsp?a=insert" id="form1" method="post">
                                        <!-- form 标签开始 -->


                                        <div style="display: none">
                                            <input type="hidden" name="issh" value="否"/>

                                            <input type="hidden" id="shangpinbianhao" name="shangpinbianhao"
                                                   value="<%= Info.html(map.get("shangpinbianhao")) %>"/>
                                            <input type="hidden" id="pinpai" name="pinpai"
                                                   value="<%= Info.html(map.get("pinpai")) %>"/>
                                            <input type="hidden" id="mingcheng" name="mingcheng"
                                                   value="<%= Info.html(map.get("mingcheng")) %>"/>
                                            <input type="hidden" id="fenlei" name="fenlei"
                                                   value="<%= Info.html(map.get("fenlei")) %>"/>

                                            <input type="hidden" id="jiage" name="jiage"
                                                   value="<%= Info.html(map.get("jiage")) %>"/>
                                            <input type="text" class="form-control" style="width:150px;"
                                                   readonly="readonly" id="goumairen" name="goumairen"
                                                   value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                            <input type="hidden" name="shangpinxinxiid" value="<%= map.get("id") %>"/>
                                            <input name="referer" id="referer" value="" type="hidden"/>
                                            <script>
                                                $('#referer').val(location.href);
                                            </script>
                                        </div>

                                        <div class="mt10">
                                            <div class="spec-list">
                                                <div class="spec">
                                <span class="spec-name">规格</span>
                                                    <% List<String> spguige = Info.objectSplit(",", map.get("guige")); %>
                                                    <% for (String t : spguige) { %>
                                                    <label class="spec-value">
                                                        <input type="radio" name="guige" value="<%= t %>"  data-rule-required="true" data-msg-required="请选择规格"/>
                                                        <span><%= t %></span></label>
                                                    <% } %>
                                                </div>
                                            </div>

                                            <div class="mt10">
                                                <div class="form-group mt10">
                                                    购买数量：

                                                    <input type="number" class="form-control" style="width:150px;"
                                                           data-rule-required="true" data-msg-required="请填写购买数量"
                                                           min="1" max="<%= map.get("kucun") %>"
                                                           number="true" data-msg-number="输入一个有效数字" id="goumaishuliang"
                                                           name="goumaishuliang" value="1"/>
                                                </div>
                                            </div>
                                            <div class="mt10">
                                                <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="alert('你尚未登录，请登录后操作')">
                                                    加入购物车
                                                </button>
                                                <% } else { %>
                                                <button type="submit" class="btn btn-primary">
                                                    加入购物车
                                                </button>
                                                <% } %>

                                                <button type="button" class="btn btn-default"
                                                        onclick="location.href='jrsc.jsp?id=<%= map.get("id") %>&biao=shangpinxinxi&ziduan=mingcheng'">
                                                    收藏
                                                </button>
                                            </div>
                                        </div>

                                        <!--form标签结束--></form>
                                    <script>
                                        $(function () {
                                            $('#form1').validate();
                                        })
                                    </script>
                                </div>
                            </div>
                            <div class="goods-content">
                                <%= map.get("xiangqing") %>
                            </div>

                            <script>
                                (function () {
                                    var images = "<%= map.get("tupian") %>".split(",");
                                    if (images.length > 0) {
                                        for (var i = 0; i < images.length; i++) {
                                            var path = images[i]
                                            var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                            $('#shangpin-galler .swiper-wrapper').append(src);
                                            $('#shangpin-thumb .swiper-wrapper').append(src);
                                        }

                                        var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                            spaceBetween: 10,
                                            slidesPerView: 4,
                                            watchSlidesVisibility: true,//防止不可点击
                                        })
                                        var gallerySwiper = new Swiper('#shangpin-galler', {
                                            spaceBetween: 10,
                                            thumbs: {
                                                swiper: thumbsSwiper,
                                            }
                                        })
                                    }

                                })();

                            </script>

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