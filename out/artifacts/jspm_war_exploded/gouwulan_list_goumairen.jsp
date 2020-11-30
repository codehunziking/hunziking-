<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>

<div style="padding: 10px">
    <%
        //------------------------------------------------
        String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误
        where += " AND goumairen='" + request.getSession().getAttribute("username") + "' "; //  设置goumairen为当前登录用户


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


        if (request.getParameter("shangpinxinxiid") != null && !"".equals(request.getParameter("shangpinxinxiid"))) {
            where += " AND shangpinxinxiid='" + request.getParameter("shangpinxinxiid") + "' ";

        }
        if (request.getParameter("shangpinbianhao") != null && !"".equals(request.getParameter("shangpinbianhao"))) {
            where += " AND shangpinbianhao LIKE '%" + request.getParameter("shangpinbianhao") + "%'";
        }
        if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
            where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
        }
        if (request.getParameter("goumaishuliang_start") != null && !"".equals(request.getParameter("goumaishuliang_start"))) {
            where += " AND goumaishuliang >='" + request.getParameter("goumaishuliang_start") + "' ";
        }
        if (request.getParameter("goumaishuliang_end") != null && !"".equals(request.getParameter("goumaishuliang_end"))) {
            where += " AND goumaishuliang <='" + request.getParameter("goumaishuliang_end") + "' ";
        }
        if (request.getParameter("xiaoji_start") != null && !"".equals(request.getParameter("xiaoji_start"))) {
            where += " AND xiaoji >='" + request.getParameter("xiaoji_start") + "' ";
        }
        if (request.getParameter("xiaoji_end") != null && !"".equals(request.getParameter("xiaoji_end"))) {
            where += " AND xiaoji <='" + request.getParameter("xiaoji_end") + "' ";
        }
        List<HashMap> list = Query.make("gouwulan").where(where).order(orderby + " " + sort).page(15);

        HashMap total = Query.make("gouwulan").field("(sum(xiaoji)) sum_xiaoji").where(where).field("(sum(xiaoji)) sum_xiaoji").find();
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            购物篮        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>
                    <div class="form-group">
                        商品编号

                        <input type="text" class="form-control" style="" name="shangpinbianhao"
                               value="<%= request.getParameter("shangpinbianhao") !=null ? request.getParameter("shangpinbianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        名称

                        <input type="text" class="form-control" style="" name="mingcheng"
                               value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>"/>
                    </div>
                    <div class="form-group">
                        购买数量

                        <input type="text" class="form-control" style="width:80px;" name="goumaishuliang_start"
                               value="<%= request.getParameter("goumaishuliang_start") !=null ? request.getParameter("goumaishuliang_start") : "" %>"/>-
                        <input type="text" class="form-control" style="width:80px;" name="goumaishuliang_end"
                               value="<%= request.getParameter("goumaishuliang_end") !=null ? request.getParameter("goumaishuliang_end") : "" %>"/>
                    </div>
                    <div class="form-group">
                        小计

                        <input type="text" class="form-control" style="width:80px;" name="xiaoji_start"
                               value="<%= request.getParameter("xiaoji_start") !=null ? request.getParameter("xiaoji_start") : "" %>"/>-<input
                            type="text" class="form-control" style="width:80px;" name="xiaoji_end"
                            value="<%= request.getParameter("xiaoji_end") !=null ? request.getParameter("xiaoji_end") : "" %>"/>
                    </div>
                    <select class="form-control" name="order" id="orderby">

                        <option value="id">按发布时间</option>
                        <option value="jiage">
                            按价格
                        </option>
                        <option value="goumaishuliang">
                            按购买数量
                        </option>

                    </select>
                    <select class="form-control" name="sort" id="sort">

                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>

                    </select>
                    <script>$("#orderby").val("<%= orderby %>");
                    $("#sort").val("<%= sort %>");</script>
                    <button type="submit" class="btn btn-default">
                        搜索
                    </button>


                    <!--form标签结束--></form>
            </div>


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 商品编号</th>
                        <th> 品牌</th>
                        <th> 名称</th>
                        <th> 分类</th>
                        <th> 规格</th>
                        <th> 价格</th>
                        <th> 购买数量</th>
                        <th> 小计</th>
                        <th> 购买人</th>
                        <th width="80" data-field="issh">审核状态</th>
                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                <%= i %>
                            </label>
                        </td>
                        <td><%= map.get("shangpinbianhao") %>
                        </td>
                        <td><%= map.get("pinpai") %>
                        </td>
                        <td><%= map.get("mingcheng") %>
                        </td>
                        <td><%
                            HashMap mapfenlei8 = new CommDAO().find("SELECT fenleimingcheng FROM fenlei where id='" + map.get("fenlei") + "'");
                        %><%= mapfenlei8.get("fenleimingcheng") %>
                        </td>
                        <td><%= map.get("guige") %>
                        </td>
                        <td><%= map.get("jiage") %>
                        </td>
                        <td><%= map.get("goumaishuliang") %>
                        </td>
                        <td><%= map.get("xiaoji") %>
                        </td>
                        <td><%= map.get("goumairen") %>
                        </td>
                        <td>
                            <%= map.get("issh") %>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">

                            <a href="gouwulan_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="gouwulan.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            ${page.info}
            <p>
                小计总和: <%= total.get("sum_xiaoji") %> 　　<a href="dingdanxinxi_add.jsp?sum_xiaoji=<%= total.get("sum_xiaoji") %>">生成订单</a>
            </p>


        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
