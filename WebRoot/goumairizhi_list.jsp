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


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


        if (request.getParameter("shangpin") != null && !"".equals(request.getParameter("shangpin"))) {
            where += " AND shangpin LIKE '%" + request.getParameter("shangpin") + "%'";
        }
        if (request.getParameter("leixing") != null && !"".equals(request.getParameter("leixing"))) {
            where += " AND leixing LIKE '%" + request.getParameter("leixing") + "%'";
        }
        List<HashMap> list = Query.make("goumairizhi").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            购买日志        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>
                    <div class="form-group">
                        商品

                        <input type="text" class="form-control" style="" name="shangpin"
                               value="<%= request.getParameter("shangpin") !=null ? request.getParameter("shangpin") : "" %>"/>
                    </div>
                    <div class="form-group">
                        类型

                        <input type="text" class="form-control" style="" name="leixing"
                               value="<%= request.getParameter("leixing") !=null ? request.getParameter("leixing") : "" %>"/>
                    </div>
                    <select class="form-control" name="order" id="orderby">

                        <option value="id">按发布时间</option>

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


            <form action="goumairizhi_batch.jsp" method="post" id="form-batch">
                <div class="">
                    <table width="100%" border="1" class="table table-list table-bordered table-hover">
                        <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th> 商品</th>
                            <th> 类型</th>
                            <th> 小计</th>
                            <th> 操作人</th>
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
                            <td><%= map.get("shangpin") %>
                            </td>
                            <td><%= map.get("leixing") %>
                            </td>
                            <td><%= map.get("xiaoji") %>
                            </td>
                            <td><%= map.get("caozuoren") %>
                            </td>
                            <td align="center"><%= map.get("addtime") %>
                            </td>
                            <td align="center">

                                <a href="goumairizhi_detail.jsp?id=<%= map.get("id") %>">
                                    详细
                                </a>

                                <a href="goumairizhi.jsp?a=delete&id=<%= map.get("id") %>"
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
