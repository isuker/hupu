{%extends file="common/page/layout.tpl"%} 
{%block name="block_head_static"%}
{%require name="teams:static/soccer-teams/news.css"%}
{%script%}
        var toShare = require("common:widget/ui/share/share.js");

        //全局分享事件, 每个页面单独注册.
        $(document).on("page:share", function(){
            toShare();
        });
    {%/script%}
{%/block%}
{%block name="content"%}
{%widget
        name="common:widget/inner-top-nav/nav.tpl"
    %}
<section class="m-wrap teams-data-wrap">
{%widget
            name="teams:widget/soccer-team-header/header.tpl"
        %}
{%widget
            name="common:widget/inner-tab/tab.tpl"
            tabClass="soccer-team"
            selected=2
        %}
{%if !empty($newsList)%}
<section class="card-col-4 card-col-nobrfore" dace-node="{%$id4dace|f_escape_xml%}_news">
<div class="card-wrap">
<article class="bd">
{%$listClass=[]%}
{%foreach from=$newsList item=val key=keys%}
{%if isset($val["bigPic"])%}
{%$val["img"] = $val["bigPic"]%}
{%/if%}
{%* 有图 *%}
{%if isset($val["img"])%}
{%* isBigShow 虎扑制造第一张图片是大图 *%}
{%if isset($isBigShow) && $keys == 0%}
{%$listClass="big-pic-list"%}
{%* 右侧小图 *%}
{%else%}
{%$listClass="smail-pic-list"%}
{%/if%}
{%else%}
{%$listClass="general-list"%}
{%/if%}
<a href="{%$val["url"]|f_escape_xml%}" class="list {%$listClass|f_escape_xml%}">
{%if isset($val["img"])%}
<div class="small-pic" style="background-image: url({%$val["img"]|f_escape_xml%})"></div>
{%/if%}
<div class="news-text">
<div class="name">
<span>{%$val["title"]|f_escape_xml%}</span>
</div>
<div class="other-info">
<div class="bt-lf">{%$val["media"]|f_escape_xml%}</div>
<div class="bt-time">{%$val["date"]|f_escape_xml%}</div>
{%if !empty($val["reply_count"])%}
<span class="view-number">
<i class="icon-comment"></i>
{%$val["reply_count"]|f_escape_xml%}
</span>
{%/if%}
</div>
</div>
</a>
{%/foreach%}
</article>
</div>
</section>
{%/if%}
</section>
{%require name='teams:page/soccer-teams-news.tpl'%}{%/block%}