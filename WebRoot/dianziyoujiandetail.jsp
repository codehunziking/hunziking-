<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%
                %>
<% HashMap map = Query.make("dianziyoujian").where("id", request.getParameter("id")).find(); %><%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>




<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>