{%extends file="common/page/layout.tpl"%} 
{%block name="head_static"%}
{%require name="team:static/otherPlayerDetail/otherPlayerDetail.css"%}
{%/block%}
{%block name="content"%}
<div class="gamecenter_livestart">
<div class="bgs_png" style="display:none;"></div>
{%widget name="common:widget/ad-980/ad-980.tpl"%}
{%widget
        name="common:widget/page-tab/page-tab.tpl"
        title="球员"
    %}
{%widget
        name="common:widget/bread-crumbs/bread-crumbs.tpl"
        title1="NBA比赛中心"
        title2="NBA球员"
        title3="{%$player_info.name|f_escape_xml%}"
        link2="{%$nav_link.player|f_escape_xml%}"
    %}
<div class="gamecenter_content clearfix">
<div class="gamecenter_content_l">
<div class="team_data">
<h2>
{%if !empty($player_info.name)%}
{%$player_info.name|f_escape_xml%}（{%$player_info.eng_name|f_escape_xml%}）{%else%}
{%$player_info.eng_name|f_escape_xml%}
{%/if%}
</h2>
<div class="content">
<div class="content_a">
<div class="clearfix">
<div class="img">
<img src="{%$player_info.photo_link|f_escape_xml%}">
</div>
<div class="font">
<p>位置：{%$player_info.position|default:"不详"|f_escape_xml%}{%if !empty($player_info.number)%}（{%$player_info.number|f_escape_xml%}号）{%/if%}</p>
<p>身高：{%$player_info.height|default:"不详"|f_escape_xml%}</p>
<p>体重：{%$player_info.weight|default:"不详"|f_escape_xml%}</p>
<p>生日：{%$player_info.birth_date|default:"不详"|f_escape_xml%}</p>
{%if !empty($player_info.college_school)%}<p>学校：{%$player_info.college_school|f_escape_xml%}</p>{%/if%}
<p>选秀：{%if !empty($player_info.draft_year) || !empty($player_info.draft_round) || !empty($player_info.draft_year) %}{%$player_info.draft_year|f_escape_xml%}年第{%$player_info.draft_round|f_escape_xml%}轮第{%$player_info.draft_pick|f_escape_xml%}顺位{%/if%}</p>
<p>国籍：{%$player_info.country|default:"不详"|f_escape_xml%}</p>
</div>
</div>
</div>
</div>
</div>
<div class="nba_video">
<div class="title">
<a href="http://v.liangle.com/nba" class="more">更多</a>NBA视频</div>
<ul class="clearfix">
{%foreach $video as $val%}
<li>
<div class="img">
<img src="{%$val.img|f_escape_xml%}" alt="{%$val.title|f_escape_xml%}">
</div>
<div class="fonts">
<p class="txt">
<a href="{%$val.url|f_escape_xml%}">{%$val.title|f_escape_xml%}</a>
</p>
<p>分享:<s>{%$val.author|f_escape_xml%}</s></p>
<p>时间:{%$val.dateline|f_escape_xml%}</p>
</div>
</li>
{%/foreach%}
</ul>
</div>
</div>
<div class="gamecenter_content_r">
<div class="bbs_a" style="margin-top:0px;">
<div class="title">
<a href="http://voice.hupu.com/nba/" class="more">更多</a>NBA新闻</div>
<ul class="hour">
{%foreach $news as $val%}
<li>
<a target="_blank" title="{%$val.title|f_escape_xml%}" href="{%$val.url|f_escape_xml%}">{%$val.title|f_escape_xml%}</a>
</li>
{%/foreach%}
</ul>
</div>
<div class="bbs_a">
<div class="title">
<a href="http://bbs.hupu.com/all-nba" class="more">更多</a>NBA帖子</div>
<ul class="hour">
{%foreach $bbs as $val%}
<li>
<a target="_blank" title="{%$val.title|f_escape_xml%}" href="{%$val.url|f_escape_xml%}">{%$val.title|f_escape_xml%}</a>
</li>
{%/foreach%}
</ul>
</div>
</div>
</div>
</div>
{%require name='team:page/otherPlayerDetail.tpl'%}{%/block%}
