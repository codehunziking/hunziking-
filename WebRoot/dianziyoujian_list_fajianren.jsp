<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
<%
//------------------------------------------------
String orderby = util.Request.get("order" , "id");  // 获取搜索框中的排序字段、默认为发布时间
String sort  = util.Request.get("sort" , "desc");   // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误
    where += " AND fajianren='"+request.getSession().getAttribute("username")+"' "; //  设置fajianren为当前登录用户



// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


         if(request.getParameter("dingdanxinxiid") != null && !"".equals( request.getParameter("dingdanxinxiid") )){ 
    where += " AND dingdanxinxiid='"+request.getParameter("dingdanxinxiid")+"' ";

    }
             if(request.getParameter("dingdanhao") != null && !"".equals( request.getParameter("dingdanhao") )){ where+=" AND dingdanhao LIKE '%"+request.getParameter("dingdanhao")+"%'"; } 
                 if(request.getParameter("dingdanxinxi") != null && !"".equals( request.getParameter("dingdanxinxi") )){ where+=" AND dingdanxinxi LIKE '%"+request.getParameter("dingdanxinxi")+"%'"; } 
                                         if(request.getParameter("shoujianren") != null && !"".equals( request.getParameter("shoujianren") )){ where+=" AND shoujianren LIKE '%"+request.getParameter("shoujianren")+"%'"; } 
        List<HashMap> list = Query.make("dianziyoujian").where(where).order(orderby+" "+sort).page(15);

        %>

        



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            电子邮件        </span>
        <span>列表</span>
    </div>
    <div class="panel-body">
        <div class="pa10 bg-warning">
            <form class="form-inline" action="?"><!-- form 标签开始 -->
    
                <div class="form-group">
    
    
                    <i class="glyphicon glyphicon-search"></i>
                
</div>
                                                            <div class="form-group">
    订单号
    
                            <input type="text" class="form-control" style="" name="dingdanhao" value="<%= request.getParameter("dingdanhao") !=null ? request.getParameter("dingdanhao") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    订单信息
    
                                                    
</div>
                                                                                                                                                                                        <div class="form-group">
    收件人
    
                            <input type="text" class="form-control" style="" name="shoujianren" value="<%= request.getParameter("shoujianren") !=null ? request.getParameter("shoujianren") : "" %>"/>                        
</div>
                                                        <select class="form-control" name="order" id="orderby">

                    <option value="id">按发布时间</option>
                                    
</select>
                <select class="form-control" name="sort" id="sort">

                    <option value="desc">倒序</option>
                    <option value="asc">升序</option>
                
</select>
                <script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
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
                        <th> 订单号 </th>
<th> 订单信息 </th>
<th> 总计 </th>
<th> 收货人 </th>
<th> 联系电话 </th>
<th> 地址 </th>
<th> 下单人 </th>
<th> 内容 </th>
<th> 收件人 </th>
<th> 发件人 </th>
                                                                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% 
                int i= 0;
                for(HashMap map:list){
                i++;
                 %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map.get("dingdanhao") %> </td>
<td> <%= map.get("dingdanxinxi") %> </td>
<td> <%= map.get("zongji") %> </td>
<td> <%= map.get("shouhuoren") %> </td>
<td> <%= map.get("lianxidianhua") %> </td>
<td> <%= map.get("dizhi") %> </td>
<td> <%= map.get("xiadanren") %> </td>
<td> <%= map.get("neirong") %> </td>
<td> <%= map.get("shoujianren") %> </td>
<td> <%= map.get("fajianren") %> </td>
                                                                        <td align="center"><%= map.get("addtime") %></td>
                        <td align="center">
                            
                                                                                        <a href="dianziyoujian_detail.jsp?id=<%= map.get("id") %>">
                                    详细
                                </a>
                                                        <a href="dianziyoujian_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="dianziyoujian.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            
        ${page.info}
        


    </div>



</div>








</div>
<%@ include file="foot.jsp" %>
