<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html><html lang=zh>
<head>
	<title>${config.system_website_name}-${article.title }</title>	
	<%@ include file="jscss.jsp" %>
</head>
<body>
<%@ include file="top.jsp" %>
<%@ include file="head.jsp" %>
<div class="i_main_bg">
	<div class="i_main">
    	<!--  左侧-->
    	<div class="i_main_left">
            <div class="left_two bg_radius margin_top0">
                 <div class="two_title">
						<%--<div class="jiantou info_top20">
	                        <c:if test="${preId!=0 }"><span class="info_jiantou"><a id="next" class="pre" href="/article/${preId }"></a></span></c:if>
	                        <c:if test="${nextId!=0 }"><span class="info_next"><a id="next" class="next" href="/article/${nextId }">下一条</a></span></c:if>
	                        <div class="clear"></div>
						</div> --%>
						<span class="name_pic"><img src="${config.system_resource_url }/static${article.avatar}"></span>
						<span class="padding_left10">${article.nick }</span>
						<span class="padding_left10 englist color_99">${article.create_time }</span>
               	</div>
                <form>
                	<input id="pos" type="hidden" value="${param.pos }"/>
                </form>
                <div id="title" class="two_name">${article.title }</div>
                <c:if test="${article.type=='PIC' }">
	                <div id="content" class="two_info"><br><img id="article_pic" src="${config.pic_domain }/article/0${article.pic }" style="max-width: 559px;"/></div></c:if>
	            <c:if test="${article.type=='TEXT' }"><div id="content" class="two_info">${article.content }<br></div></c:if>
	            <c:if test="${article.type=='ASHAMED' }"><div id="content" class="two_info">${article.content }<br></div></c:if>
                <div class="zhichi_bg">
                	<div class="chizhi_left"><a data-id="${article.id }" href="javascript:void(0);" class="color_1 updown up"><span class="one1"></span><b>${article.up }</b></a></div>
                    <div class="chizhi_left"><a data-id="${article.id }"  href="javascript:void(0);" class="color_1 updown down"><span class="one2"></span><b>${article.down }</b></a></div>
                    <div class="jiantou info_top20">
	                	<c:if test="${preId!=0 }"><span class="info_jiantou"><a id="next" class="pre" href="/article/${preId }"></a></span></c:if>
	                	<c:if test="${nextId!=0 }"><span class="info_next"><a id="next" class="next" href="/article/${nextId }">下一条</a></span></c:if>
	                    <span id="article_draw" style="color: red;padding:5px;display: none;">(点评：<em>--</em>次 , 签到机会：<a href="/lottery/draw"><em style="color:blue;">--</em></a>次)</span>
	                    <div class="clear"></div>
	                </div>
                    <div class="bshare_bg">
                        <div class="bshare_info">
                        	<ul>
                            	<li><a id="tsina" class="one1 share_button"></a></li>
                            	<li><a id="qzone" class="one2 share_button"></a></li>
                            	<li><a id="tqq" class="one3 share_button"></a></li>
                            	<li class="end" onmousemove="document.getElementById('bshare_list').style.display='block'" onmouseout="document.getElementById('bshare_list').style.display='none'"><a href="#" class="next"></a>
                                	<div class="bshare_list_bg" id="bshare_list" style="display: none;">
                                        <div class="bshare_jt_top"></div>
                                        <div class="bshare_list">
                                            <ul>
                                                <li class="tenxun"><a id="tqq" class="share_button">腾讯微博</a></li>
                                                <li class="qq"><a id="cqq" class="share_button">QQ好友</a></li>
                                                <li class="douban"><a id="douban" class="share_button">豆瓣</a></li>
                                                <li class="renren"><a id="renren" class="share_button">人人网</a></li>
                                            </ul>
                                            <div class="clear"></div>
                                        </div>
									</div>                                	
                                </li>
                            </ul>
                        </div>
                    	<span></span>
                    </div>
                </div>
            </div>
            <div class="info_advert_list" style="background-color: #fff;">
            	<div style="float:left;" id="ad1">${ads.ad12.content }</div>
            	<div style="float:left;padding-left:40px;" id="ad2">${ads.ad13.content }</div>
            </div>
            <div style="padding: 20px 0 0;background-color: #fff;">
            </div>
            <c:forEach var="a" items="${hots_text }">
            	<div class="left_two bg_radius page">
                <div class="two_title">
                	<div class="title_more"><a href="/article/${a.id }" target="_blank">查看全文</a></div>
                	<span class="name_pic"><img src="${config.system_resource_url }/static${a.avatar }"></span>
                    <span class="padding_left10">${a.nick }</span>
                    <span class="padding_left10 englist color_99">${a.create_time }</span>
                </div>
	            <c:if test="${a.type=='TEXT' }"><div class="two_name"><a href="/text">【爆笑文字】</a><a href="/article/${a.id }" target="_blank">${a.title } </a></div><div class="two_info">${a.content }<br></div></c:if>
                <div class="zhichi_bg">
                	<div class="chizhi_left"><a href="javascript:void(0);" data-id="${a.id }" class="color_1 updown up"><span class="one1"></span><b>${a.up }</b></a></div>
                    <div class="chizhi_left"><a href="javascript:void(0);" data-id="${a.id }" class="color_1 updown down"><span class="one2"></span><b>${a.down }</b></a></div>
                </div>
            </div>
            </c:forEach>
        </div>
    	<!--  右侧-->
        <div class="i_main_right">
        	${ads.ad8.content }
            <div class="right_botton_bg margin_top10">
            	<span class="top"><a href="#top"></a></span>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script src="${config.system_resource_url }/static/js/article.js" type="text/javascript"></script>
<%@ include file="foot.jsp" %>
</body>
</html>