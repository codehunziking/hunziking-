<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>

<div style="padding: 10px">
                
<% HashMap map = Query.make("shangpinxinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                商品编号            </td>
            <td><%= map.get("shangpinbianhao") %></td>
            
                                    <td width="180">
                品牌            </td>
            <td><%= map.get("pinpai") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                名称            </td>
            <td><%= map.get("mingcheng") %></td>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapfenlei4 = new CommDAO().find("SELECT fenleimingcheng FROM fenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapfenlei4.get("fenleimingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                规格            </td>
            <td><%= map.get("guige") %></td>
            
                                    <td width="180">
                价格            </td>
            <td><%= map.get("jiage") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                销量            </td>
            <td><%= map.get("xiaoliang") %></td>
            
                                    <td width="180">
                库存            </td>
            <td><%= map.get("kucun") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                是否推荐            </td>
            <td><%= map.get("shifoutuijian") %></td>
            
                                    <td width="180">
                图片            </td>
            <td><fieldset class="images_box"><div id="gellay_images" class="imagesList"><script>
            var images = "<%= map.get("tupian") %>".split(',');
            for(var i=0;i<images.length;i++){
                var image = images[i];
                var uploadImage = '<div class="uploadImage">' +
                '<span class="thumb thumbnail"><img src="'+image+'"/></span>'+
                '</div>';
                document.writeln(uploadImage);
            }
            
</script></div></fieldset></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                详情            </td>
            <td><%= map.get("xiangqing") %></td>
            
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
