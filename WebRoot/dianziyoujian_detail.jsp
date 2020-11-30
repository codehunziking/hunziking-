<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
                
<% HashMap map = Query.make("dianziyoujian").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                订单号            </td>
            <td><%= map.get("dingdanhao") %></td>
            
                                    <td width="180">
                订单信息            </td>
            <td><%= map.get("dingdanxinxi") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                总计            </td>
            <td><%= map.get("zongji") %></td>
            
                                    <td width="180">
                收货人            </td>
            <td><%= map.get("shouhuoren") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                联系电话            </td>
            <td><%= map.get("lianxidianhua") %></td>
            
                                    <td width="180">
                地址            </td>
            <td><%= map.get("dizhi") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                下单人            </td>
            <td><%= map.get("xiadanren") %></td>
            
                                    <td width="180">
                内容            </td>
            <td><%= map.get("neirong") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                收件人            </td>
            <td><%= map.get("shoujianren") %></td>
            
                                    <td width="180">
                发件人            </td>
            <td><%= map.get("fajianren") %></td>
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
