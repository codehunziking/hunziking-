<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
    //------------------------------------------------
    String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

    String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


    if (request.getParameter("shangpinbianhao") != null && !"".equals(request.getParameter("shangpinbianhao"))) {
        where += " AND shangpinbianhao LIKE '%" + request.getParameter("shangpinbianhao") + "%'";
    }
    if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
        where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }
    if (request.getParameter("shifoutuijian") != null && !"".equals(request.getParameter("shifoutuijian"))) {
        where += " AND shifoutuijian ='" + request.getParameter("shifoutuijian") + "'";
    }
    List<HashMap> list = Query.make("shangpinxinxi").where(where).order(orderby + " " + sort).page(15);

%>

<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link href="js/owl/owl.carousel.min.css" rel="stylesheet">
<script src="js/owl/owl.carousel.min.js"></script>


<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-modelbox-widget wow fadeInUpBig" data-wow-duration="1.6s" data-wow-delay="0s"
                     data-wow-iteration="1"
                     style="margin:35px 0 0 0;background-color:#FFFFFF;box-shadow:0px 0px 10px 3px #7E7E7E">
                    <h3 class="section-title">
                       <%-- <div class="more">
                            <a href="shangpinxinxilist.jsp">更多>></a>
                        </div>--%>
                        商品列表
                    </h3>
                    <div class="sidebar-widget-body">


                        <div class="shop-product-xz">
                            <div class="clearfix">
                                <% for (HashMap r : list) { %>
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
                            ${page.info}
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