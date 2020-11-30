<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>









<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加订单信息:
        </div>
        <div class="panel-body">
            <form action="dingdanxinxi.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单号</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="dingdanhao" name="dingdanhao" value="<%= Info.getID() %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单信息</label>
        <div class="col-sm-8">
            
                                                    <% 
 List<HashMap> dataListdingdanxinxi = new CommDAO().select("SELECT * FROM gouwulan WHERE goumairen='"+request.getSession().getAttribute("username")+"' ORDER BY id desc"); 
 %><div id="dataListdingdanxinxi" style="text-align: left;"><table class="table">
<thead><tr><td>商品编号</td><td>品牌</td><td>名称</td><td>分类</td><td>规格</td><td>价格</td><td>购买数量</td><td>小计</td></tr></thead><tbody><tr><%  for(HashMap dataMap:dataListdingdanxinxi){  %><td><%= dataMap.get("shangpinbianhao") %></td><td><%= dataMap.get("pinpai") %></td><td><%= dataMap.get("mingcheng") %></td><td><% 
 HashMap mapfenlei13 = new CommDAO().find("SELECT fenleimingcheng FROM fenlei where id='"+dataMap.get("fenlei")+"'"); 
 %><%= mapfenlei13.get("fenleimingcheng") %></td><td><%= dataMap.get("guige") %></td><td><%= dataMap.get("jiage") %></td><td><%= dataMap.get("goumaishuliang") %></td><td><%= dataMap.get("xiaoji") %></td></tr></tbody><% } %>
</table></div><input id="dingdanxinxi" name="dingdanxinxi" type="hidden"/><script>$("#dingdanxinxi").val($("#dataListdingdanxinxi").html());</script>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">总计</label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="zongji" name="zongji" value="<%= request.getParameter("sum_xiaoji") !=null ? request.getParameter("sum_xiaoji") : "" %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货人<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写收货人" id="shouhuoren" name="shouhuoren" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">联系电话<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写联系电话" phone="true" data-msg-phone="请输入正确手机号码" id="lianxidianhua" name="lianxidianhua" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">地址<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:250px;" data-rule-required="true" data-msg-required="请填写地址" id="dizhi" name="dizhi" value=""/>                                            
        </div>
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">下单人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="xiadanren" name="xiadanren" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                        
                                                                                                                        <input type="hidden" name="iszf" value="否"/>
                                            
                    <button type="submit" class="btn btn-primary" name="Submit">
    提交
</button>
                    <button type="reset" class="btn btn-default" name="Submit2">
    重置
</button>

                
        </div>
    </div>
</div>
            
<!--form标签结束--></form>
        </div>
    </div>

<!-- container定宽，并剧中结束 --></div>





<script>
    $(function () {
        $('#form1').validate();
    });
</script>



</div>
<%@ include file="foot.jsp" %>
