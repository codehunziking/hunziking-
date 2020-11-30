<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">

<% HashMap map = Query.make("goumairizhi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                商品            </td>
            <td><%= map.get("shangpin") %></td>
            
                                    <td width="180">
                类型            </td>
            <td><%= map.get("leixing") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                小计            </td>
            <td><%= map.get("xiaoji") %></td>
            
                                    <td width="180">
                操作人            </td>
            <td><%= map.get("caozuoren") %></td>
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
