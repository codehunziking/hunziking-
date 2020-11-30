<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link href="js/tags/tags.css" rel="stylesheet">
<script src="js/tags/tags.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

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
            添加商品信息:
        </div>
        <div class="panel-body">
            <form action="shangpinxinxi.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品编号</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.getID() %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">品牌<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写品牌" id="pinpai" name="pinpai" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">名称<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:250px;" data-rule-required="true" data-msg-required="请填写名称" id="mingcheng" name="mingcheng" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">分类</label>
        <div class="col-sm-8">
            
                                                    <select class="form-control class_fenlei8" data-value="" id="fenlei" name="fenlei" style="width:250px">
<% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM fenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>

</select>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">规格<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input data-rule-required="true" data-msg-required="请填写规格" id="guige" name="guige" value="" type="text"/><script>$(function() {
          $("#guige").tagInput();
        })</script>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">价格<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写价格" number="true" data-msg-number="输入一个有效数字" id="jiage" name="jiage" value=""/>                                            
        </div>
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">库存<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写库存" number="true" data-msg-number="输入一个有效数字" id="kucun" name="kucun" value=""/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">是否推荐</label>
        <div class="col-sm-8">
            
                                                    <div class="class_shifoutuijian9" data-value=""> <label id="shifoutuijian" name="shifoutuijian" value="是"><input type="radio" id="shifoutuijian" name="shifoutuijian" value="是"/>  是 </label> 
 <label id="shifoutuijian" name="shifoutuijian" value="否"><input type="radio" id="shifoutuijian" name="shifoutuijian" value="否"/>  否 </label> 
</div>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">图片</label>
        <div class="col-sm-8">
            
                                                    <input type="hidden" id="tupian" name="tupian" value=""/>
        <script>showUploadImages("#tupian")</script>
                                                    
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">详情</label>
        <div class="col-sm-8">
            
                                                    <textarea id="xiangqing" name="xiangqing" style="max-width: 750px;width:100%; height: 300px;"></textarea><script>
            (function(){
                var um = UM.getEditor('xiangqing');
            })();
            </script>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                        
                                                                                                                
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
