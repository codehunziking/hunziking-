<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
<%
if(request.getParameter("delete")!=null)
{
    String[] ids = request.getParameterValues("ids");
    if(ids!=null && ids.length>0) {
                                Query.make("liulanjilu").where("id" , "in" , ids).delete();
            }
}
%>
<script>
    alert("批量处理成功");
    location.replace(document.referrer);
</script></div>
<%@ include file="foot.jsp" %>
