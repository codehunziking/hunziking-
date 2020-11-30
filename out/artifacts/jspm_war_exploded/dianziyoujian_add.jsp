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



    
    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("dingdanxinxi").where("id", request.getParameter("id")).find(); %>





<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加电子邮件:
        </div>
        <div class="panel-body">
            <form action="dianziyoujian.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单号</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("dingdanhao") %><input type="hidden" id="dingdanhao" name="dingdanhao" value="<%= Info.html(readMap.get("dingdanhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">订单信息</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("dingdanxinxi") %><input type="hidden" id="dingdanxinxi" name="dingdanxinxi" value="<%= Info.html(readMap.get("dingdanxinxi")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">总计</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("zongji") %><input type="hidden" id="zongji" name="zongji" value="<%= Info.html(readMap.get("zongji")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收货人</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("shouhuoren") %><input type="hidden" id="shouhuoren" name="shouhuoren" value="<%= Info.html(readMap.get("shouhuoren")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">联系电话</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("lianxidianhua") %><input type="hidden" id="lianxidianhua" name="lianxidianhua" value="<%= Info.html(readMap.get("lianxidianhua")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">地址</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("dizhi") %><input type="hidden" id="dizhi" name="dizhi" value="<%= Info.html(readMap.get("dizhi")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">下单人</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("xiadanren") %><input type="hidden" id="xiadanren" name="xiadanren" value="<%= Info.html(readMap.get("xiadanren")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">内容</label>
        <div class="col-sm-8">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" id="neirong" name="neirong"></textarea>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">收件人<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:250px;" data-rule-required="true" data-msg-required="请填写收件人" email="true" data-msg-email="请输入有效邮件地址" id="shoujianren" name="shoujianren" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">发件人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="fajianren" name="fajianren" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                                                <input type="hidden" name="dingdanxinxiid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                    
                                                                                                                
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
