<%@ page import="util.Request" %>
<%@ page import="dao.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="head.jsp" %>
<style>th{text-align: center;}</style>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css.css">
    <script src="js/datepicker/WdatePicker.js"></script>

    <script src="js/highcharts/highcharts.js"></script>
    <script src="js/highcharts/modules/exporting.js"></script>
    <script src="js/highcharts/modules/series-label.js"></script>
    <script src="js/highcharts/modules/oldie.js"></script>

</head>
<body>

<h3>销售统计</h3>

<form action="?" method="get">
    开始日期:<input sype="text" name="kaishiriqi" value="<%=Request.get("kaishiriqi")%>"
                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})">
    结束日期:<input sype="text" name="jieshuriqi" value="<%=Request.get("jieshuriqi")%>"
                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})">
    <button type="submit">提交</button>
</form>

<%
    String where = "1=1 ";
    if (!Request.get("kaishiriqi").equals("")) {
        where += " and addtime>='" + Request.get("kaishiriqi") + " 00:00:00' ";
    }
    if (!Request.get("jieshuriqi").equals("")) {
        where += " and addtime<='" + Request.get("jieshuriqi") + " 23:59:59' ";
    }
    List<HashMap> list = Query.make("dingdanxinxi_dingdanxinxi").field("SUM(goumaishuliang) xiaoliang,SUM(xiaoji) jine,mingcheng")
            .where(where)
            .group("mingcheng")
            .order("SUM(goumaishuliang) desc")
            .select();
%>

<table class="table">
    <thead>
    <tr>

        <th>商品名称</th>
        <th>销量</th>
        <th>金额</th>
    </tr>
    </thead>
    <tbody>
    <%for (HashMap map : list) {%>
    <tr align="center">
        <td><%=map.get("mingcheng")%>
        </td>
        <td><%=map.get("xiaoliang")%>
        </td>
        <td><%=map.get("jine")%>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<br>
<div id="container" style="max-width:800px;height:400px"></div>
<script>
    var chart = Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: '销量统计'
        },
        subtitle: {
            text: '数据来源: 订单'
        },
        tooltip: {
            valueSuffix: ' 件'
        },
        xAxis: {
            title: {
                text: '商品名称'
            },
            categories: [
                <% for(HashMap map : list){ %>
                '<%=map.get("mingcheng")%>',
                <% } %>
            ]
        },
        plotOptions: {
            column: {
                borderWidth: 0
            }
        },
        series: [{
            name: '销量',
            data: [
                <%for (HashMap map : list) {%>
                <%=map.get("xiaoliang")%>,
                <% } %>
            ]
        }]
    });
</script>


</body>
</html>