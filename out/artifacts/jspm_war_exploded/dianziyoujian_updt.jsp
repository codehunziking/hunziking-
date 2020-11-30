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


<%
        // 获取需要编辑的数据
    String updtself="0"; // 设置更新
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "dianziyoujian");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑电子邮件:
        </div>
        <div class="panel-body">
            <form action="dianziyoujian.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单号</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("dingdanhao") %><input type="hidden" id="dingdanhao" name="dingdanhao" value="<%= Info.html(mmm.get("dingdanhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单信息</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("dingdanxinxi") %><input type="hidden" id="dingdanxinxi" name="dingdanxinxi" value="<%= Info.html(mmm.get("dingdanxinxi")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">总计</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("zongji") %><input type="hidden" id="zongji" name="zongji" value="<%= Info.html(mmm.get("zongji")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货人</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("shouhuoren") %><input type="hidden" id="shouhuoren" name="shouhuoren" value="<%= Info.html(mmm.get("shouhuoren")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">联系电话</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("lianxidianhua") %><input type="hidden" id="lianxidianhua" name="lianxidianhua" value="<%= Info.html(mmm.get("lianxidianhua")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">地址</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("dizhi") %><input type="hidden" id="dizhi" name="dizhi" value="<%= Info.html(mmm.get("dizhi")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">下单人</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("xiadanren") %><input type="hidden" id="xiadanren" name="xiadanren" value="<%= Info.html(mmm.get("xiadanren")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">内容</label>
        <div class="col-sm-8">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" id="neirong" name="neirong"><%= Info.html(mmm.get("neirong")) %></textarea>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收件人<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:250px;" data-rule-required="true" data-msg-required="请填写收件人" email="true" data-msg-email="请输入有效邮件地址" id="shoujianren" name="shoujianren" value="<%= Info.html(mmm.get("shoujianren")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">发件人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="fajianren" name="fajianren" value="<%= mmm.get("fajianren") %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= mmm.get("id") %>" type="hidden"/>
                                                <input name="dingdanxinxiid" value="<%= mmm.get("dingdanxinxiid") %>" type="hidden"/>
                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="<%= updtself %>" type="hidden"/>
                                        
                    
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
