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
        where += " AND liulanren='" + request.getSession().getAttribute("username") + "' "; //  设置liulanren为当前登录用户


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
        List<HashMap> list = Query.make("liulanjilu").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            浏览记录        </span>
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
                    <select class="form-control" name="order" id="orderby">

                        <option value="id">按发布时间</option>
                        <option value="jiage">
                            按价格
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


            <form action="liulanjilu_batch.jsp" method="post" id="form-batch">
                <div class="">
                    <table width="100%" border="1" class="table table-list table-bordered table-hover">
                        <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th> 商品编号</th>
                            <th> 名称</th>
                            <th> 分类</th>
                            <th> 品牌</th>
                            <th> 价格</th>
                            <th> 浏览人</th>
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
                                    <input type="checkbox" name="ids" value="<%= map.get("id") %>"/>
                                    <%= i %>
                                </label>
                            </td>
                            <td><%= map.get("shangpinbianhao") %>
                            </td>
                            <td><%= map.get("mingcheng") %>
                            </td>
                            <td><%
                                HashMap mapfenlei2 = new CommDAO().find("SELECT fenleimingcheng FROM fenlei where id='" + map.get("fenlei") + "'");
                            %><%= mapfenlei2.get("fenleimingcheng") %>
                            </td>
                            <td><%= map.get("pinpai") %>
                            </td>
                            <td><%= map.get("jiage") %>
                            </td>
                            <td><%= map.get("liulanren") %>
                            </td>
                            <td align="center"><%= map.get("addtime") %>
                            </td>
                            <td align="center">

                                <a href="liulanjilu_detail.jsp?id=<%= map.get("id") %>">
                                    详细
                                </a>
                               <%-- <a href="liulanjilu_updt.jsp?id=<%= map.get("id") %>">修改</a>--%>
                                <a href="liulanjilu.jsp?a=delete&id=<%= map.get("id") %>"
                                   onclick="return confirm('真的要删除？')">删除</a>
                                <!--qiatnalijne-->
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="" style="margin-top: 10px;">
                    <label><input type="checkbox" value="1"
                                  onclick="$('#form-batch input[name=ids]').prop('checked' , this.checked)"/>
                        全选/全不选</label>
                    <input type="submit" name="delete" value="批量删除"/>
                </div>
            </form>

            ${page.info}


        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
