<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">

<% HashMap map = Query.make("liulanjilu").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                商品编号            </td>
            <td><%= map.get("shangpinbianhao") %></td>
            
                                    <td width="180">
                名称            </td>
            <td><%= map.get("mingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapfenlei17 = new CommDAO().find("SELECT fenleimingcheng FROM fenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapfenlei17.get("fenleimingcheng") %></td>
            
                                    <td width="180">
                品牌            </td>
            <td><%= map.get("pinpai") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                价格            </td>
            <td><%= map.get("jiage") %></td>
            
                                    <td width="180">
                浏览人            </td>
            <td><%= map.get("liulanren") %></td>
                    </tr>
        <tr>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>
</div>
<%@ include file="foot.jsp" %>
