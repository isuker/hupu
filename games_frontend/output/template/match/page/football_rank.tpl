{%extends file="common/page/layout.tpl"%} 
{%block name="title"%}
{%if $league_name == "bund"%}
德甲{%else if $league_name == "epl"%}
英超{%else if $league_name == "seri"%}
意甲{%else if $league_name == "liga"%}
西甲{%else if $league_name == "fran"%}
法甲{%else if $league_name == "chlg"%}
欧冠{%else if $league_name == "csl"%}
中超{%else if $league_name == "csl_zj"%}
中甲{%else if $league_name == "afccl"%}
亚冠{%else if $league_name == "fifa"%}
国际足球{%else if $league_name == "worldcup"%}
世界杯{%else if $league_name == "eurocup"%}
欧洲杯{%else if $league_name == "amerciacup"%}
美洲杯{%/if%}
{%/block%}
{%block name="head_static"%}
{%require name="common:static/js/zepto/zepto.js"%}
{%require name="common:static/js/swiper/js/swiper.jquery.js"%}
{%require name="common:static/js/swiper/css/swiper.css"%}
{%require name="match:static/page/football_rank.scss"%}
{%script%}
		window.GM = {
            "client": "{%$client|f_escape_js%}" || "x",
            "islogin": !!parseInt("{%$is_login|f_escape_js%}", 10),
            "night":!!parseInt("{%$night|f_escape_js%}", 10),
            "leagueName": "{%$league_name|f_escape_js%}"
        };

        var footballRank = require("match:widget/football_rank/football_rank.js");
        footballRank.init();

    	// 对阵图 所以不需要锚点定位到中国球队
   		// if(GM.leagueName == "afccl"){
		//     window.location.hash = "#movetochina";
   		// }

    {%/script%}
{%/block%}
{%block name="content"%}
<section class="mod-rank-wrap" id="J-mod-rank-wrap">
<ul class="tab fixed" id="J-tab">
<li class="tab-standings active">{%$rank[0]["title"]|f_escape_xml%}</li>
<li class="tab-goals" data-type="goals">{%$rank[1]["title"]|f_escape_xml%}</li>
{%if $league_name != "csl_zj"%}
<li class="tab-assists" data-type="assists">{%$rank[2]["title"]|f_escape_xml%}</li>
{%/if%}
</ul>
<section class="swiper-container">
<section class="swiper-wrapper">
{%if $league_name == "chlg"  || $league_name == "eurocup" || $league_name == "amerciacup"%}
<section class="standings-rank swiper-slide" id="J-standings-rank" {%if !empty($against_figure)%}style="padding-top:60px;"{%else%}style="padding-top:34px;"{%/if%}>
{%* 欧冠与欧洲杯美洲杯对阵图不一样 *%}
{%if !empty($against_figure)%}
{%if $league_name == "chlg"%}
{%widget
					        name="match:widget/vs_soccer/vs_soccer.tpl"
					        leagueName=$league_name
					    %}
{%else%}
{%widget
					        name="match:widget/vs_soccer_data/vs_soccer_data.tpl"
					        leagueName=$league_name
					    %}
{%/if%}
{%/if%}
{%if !empty($rank[0]["ranks_data"])%}
{%foreach $rank[0]["ranks_data"] as $val%}
{%if $val@index == 0%}
<table class="mod-title title">
{%else%}
<table class="mod-title title">
{%/if%}
<thead>
<tr>
<td width="10%" class="type">
{%if $val@index == 0%}A{%else if $val@index == 1%}B{%else if $val@index == 2%}C{%else if $val@index == 3%}D{%else if $val@index == 4%}E{%else if $val@index == 5%}F{%else if $val@index == 6%}G{%else if $val@index == 7%}H{%/if%}组</td>
<td width="35%" align="left">球队</td>
<td width="10%" align="center">场次</td>
<td width="7%" align="center">胜</td>
<td width="7%" align="center">平</td>
<td width="7%" align="center">负</td>
<td width="14%" align="center">进/失</td>
<td width="10%" align="center">积分</td>
</tr>
</thead>
</table>
<table class="mod-table">
<tbody>
{%foreach $val as $subVal%}
<tr class="link" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/team/{%$subVal.tid|f_escape_xml%}">
<td width="10%">
<span
											{%if $subVal.rank <= 2%}
											class="red-border num"
											{%else if $subVal.rank == 3 %}
											class="yellow-border num"
											{%else%}
											class="num"
											{%/if%}>{%$subVal.rank|f_escape_xml%}</span>
</td>
<td width="35%" align="left">
<span class="td-wrap"><span class="logo"><img {%if $league_name == "chlg"%}data-src="//b1.hoopchina.com.cn/games/teams/chlg/8_{%$subVal.tid|f_escape_xml%}.png?{%$subVal@index|f_escape_xml%}"{%else%}data-src="{%$subVal.logo|f_escape_xml%}?{%$subVal@index|f_escape_xml%}"{%/if%} class="swiper-lazy" width="28" /></span><span class="name">{%$subVal.name|f_escape_xml%}</span></span>
</td>
<td width="10%" align="center">{%$subVal.mp|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.won|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.draw|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.lose|f_escape_xml%}</td>
<td width="14%" align="center">{%$subVal.gf|f_escape_xml%}/{%$subVal.ga|f_escape_xml%}</td>
<td width="10%" align="center">{%$subVal.pts|f_escape_xml%}</td>
</tr>
{%/foreach%}
</tbody>
</table>
{%/foreach%}
<p class="notice">比赛进行中，您将看到依据各支球队实时进球调整的动态排名，这可能与比赛结束后的积分榜排序稍有不同。</p>
{%else%}
<div class="mod-no-data" style="margin-top: 26px; padding-bottom: 350px;">暂无积分榜数据</div>
{%/if%}
</section>
{%else if $league_name == "afccl"%}
<section class="standings-rank swiper-slide" id="J-standings-rank" {%if !empty($against_figure)%}style="padding-top:60px;"{%else%}style="padding-top:34px;"{%/if%}>
{%if !empty($against_figure)%}
{%widget
				        name="match:widget/vs_soccer/vs_soccer.tpl"
				        leagueName="afccl"
				    %}
{%/if%}
{%if !empty($rank[0]["ranks_data"])%}
{%foreach $rank[0]["ranks_data"] as $val%}
{%if $val@index == 0%}
<table class="mod-title title">
{%else%}
<table class="mod-title title">
{%/if%}
<thead>
<tr>
<td width="10%" class="type">
{%if $val@index == 0%}A{%else if $val@index == 1%}B{%else if $val@index == 2%}C{%else if $val@index == 3%}D{%else if $val@index == 4%}E{%else if $val@index == 5%}F{%else if $val@index == 6%}G{%else if $val@index == 7%}H{%/if%}组</td>
<td width="35%" align="left">球队</td>
<td width="10%" align="center">场次</td>
<td width="7%" align="center">胜</td>
<td width="7%" align="center">平</td>
<td width="7%" align="center">负</td>
<td width="14%" align="center">进/失</td>
<td width="10%" align="center">积分</td>
</tr>
</thead>
</table>
<table class="mod-table">
<tbody>
{%foreach $val as $subVal%}
<tr class="link" {%if $val@index == 3 && $subVal@index == 3%}id="movetochina"{%/if%} link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/team/{%$subVal.tid|f_escape_xml%}">
<td width="10%">
<span
											{%if $subVal.ranking <= 2%}
											class="red-border red num"
											{%else%}
											class="num"
											{%/if%}>{%$subVal.ranking|f_escape_xml%}</span>
</td>
<td width="35%" align="left">
<span class="td-wrap"><span class="logo"><img data-src="{%$subVal.team_logo|f_escape_xml%}?t={%$val@index|f_escape_xml%}" width="28" class="swiper-lazy" /></span><span class="name">{%$subVal.team_name|f_escape_xml%}</span></span>
</td>
<td width="10%" align="center">{%$subVal.played|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.wins|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.ties|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.losses|f_escape_xml%}</td>
<td width="14%" align="center">{%$subVal.goalsFor_goalsAgainst|f_escape_xml%}</td>
<td width="10%" align="center">{%$subVal.points|f_escape_xml%}</td>
</tr>
{%/foreach%}
</tbody>
</table>
{%/foreach%}
{%else%}
<div class="mod-no-data" style="margin-top: 26px; padding-bottom: 350px;">暂无球员榜数据</div>
{%/if%}
</section>
{%else%}
<section class="standings-rank swiper-slide" id="J-standings-rank">
<table class="mod-title fixed">
<thead>
<tr>
<td width="10%" class="type">排行</td>
<td width="35%" align="left">球队</td>
<td width="10%" align="center">场次</td>
<td width="7%" align="center">胜</td>
<td width="7%" align="center">平</td>
<td width="7%" align="center">负</td>
<td width="14%" align="center">进/失</td>
<td width="10%" align="center">积分</td>
</tr>
</thead>
</table>
<table class="mod-table">
<tbody>
{%if !empty($rank[0]["ranks_data"])%}
{%foreach $rank[0]["ranks_data"] as $val%}
{%if $val@index > 0%}
<tr class="link" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/team/{%$val[9]|f_escape_xml%}">
<td width="10%">
{%if $league_name == "seri"%}
<span
											{%if $val[0] <= 3%}
											class="red num"
											{%else if $val[0] == 4 || $val[0] == 5%}
											class="yellow num"
											{%else if $val[0] >= count($rank[0]["ranks_data"])-3%}
											class="green num"
											{%else%}
											class="num"
											{%/if%}>{%$val[0]|f_escape_xml%}</span>
{%else if $league_name == "fran"%}
<span
											{%if $val[0] <= 3%}
											class="red num"
											{%else if $val[0] == 4 %}
											class="yellow num"
											{%else if $val[0] >= count($rank[0]["ranks_data"])-3%}
											class="green num"
											{%else%}
											class="num"
											{%/if%}>{%$val[0]|f_escape_xml%}</span>
{%else if $league_name == "liga" || $league_name == "bund" || $league_name == "epl"%}
<span
											{%if $val[0] <= 4%}
											class="red num"
											{%else if $val[0] == 5 || $val[0] == 6%}
											class="yellow num"
											{%else if $val[0] >= count($rank[0]["ranks_data"])-3%}
											class="green num"
											{%else%}
											class="num"
											{%/if%}>{%$val[0]|f_escape_xml%}</span>
{%else if $league_name == "csl"%}
<span
											{%if $val[0] <= 4%}
											class="red num"
											{%else if $val[0] >= count($rank[0]["ranks_data"])-2%}
											class="green num"
											{%else%}
											class="num"
											{%/if%}>{%$val[0]|f_escape_xml%}</span>
{%else if $league_name == "csl_zj"%}
<span
											{%if $val[0] <= 2%}
											class="red num"
											{%else if $val[0] >= count($rank[0]["ranks_data"])-2%}
											class="green num"
											{%else%}
											class="num"
											{%/if%}>{%$val[0]|f_escape_xml%}</span>
{%/if%}
</td>
<td width="35%" align="left">
<span class="td-wrap"><span class="logo"><img data-src="{%$val[2]|f_escape_xml%}" width="28" class="swiper-lazy" /></span><span class="name">{%$val[1]|f_escape_xml%}</span></span>
</td>
<td width="10%" align="center">{%$val[3]|f_escape_xml%}</td>
<td width="7%" align="center">{%$val[4]|f_escape_xml%}</td>
<td width="7%" align="center">{%$val[5]|f_escape_xml%}</td>
<td width="7%" align="center">{%$val[6]|f_escape_xml%}</td>
<td width="14%" align="center">{%$val[7]|f_escape_xml%}</td>
<td width="10%" align="center">{%$val[8]|f_escape_xml%}</td>
</tr>
{%/if%}
{%/foreach%}
{%else%}
<div class="mod-no-data" style="margin-top: 26px; padding-bottom: 350px;">暂无球员榜数据</div>
{%/if%}
</tbody>
</table>
{%if $league_name != "csl_zj"%}
<p class="notice">比赛进行中，您将看到依据各支球队实时进球调整的动态排名，这可能与比赛结束后的积分榜排序稍有不同。</p>
{%/if%}
</section>
{%/if%}
<section class="goals-rank mod-rank swiper-slide" id="J-goals-rank">
<table class="mod-title fixed">
<thead>
<tr>
<td width="10%" class="type">排行</td>
<td width="40%" align="left">球员</td>
<td width="25%" align="center">球队</td>
<td width="25%" align="center">进球(点球)</td>
</tr>
</thead>
</table>
<table class="mod-table">
<tbody>
{%if !empty($rank[1]["ranks_data"])%}
{%foreach $rank[1]["ranks_data"] as $val%}
{%if $val@index > 0%}
<tr class="link" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/player/{%$val[5]|f_escape_xml%}">
<td width="10%">
<span {%if $val[0] == 1%} class="red num" {%else%} class="num" {%/if%}>{%$val[0]|f_escape_xml%}</span>
</td>
<td width="40%" align="left">
<span class="logo">
<img data-src="{%$val[2]|f_escape_xml%}" class="swiper-lazy">
{%if !empty($night)%}
<span class="mask"></span>
{%/if%}
</span>
<span class="name">{%$val[1]|f_escape_xml%}</span>
</td>
<td width="25%" align="center">{%$val[3]|f_escape_xml%}</td>
<td width="25%" align="center">{%$val[4]|f_escape_xml%}</td>
</tr>
{%/if%}
{%/foreach%}
{%else%}
<div class="mod-no-data" style="margin-top: 26px; padding-bottom: 350px;">暂无射手榜数据</div>
{%/if%}
</tbody>
</table>
</section>
{%if $league_name != "csl_zj"%}
<section class="assists-rank mod-rank swiper-slide" id="J-assists-rank">
<table class="mod-title fixed">
<thead>
<tr>
<td width="10%" class="type">排行</td>
<td width="40%" align="left">球员</td>
<td width="25%" align="center">球队</td>
<td width="25%" align="center">助攻</td>
</tr>
</thead>
</table>
<table class="mod-table">
<tbody>
{%if !empty($rank[2]["ranks_data"])%}
{%foreach $rank[2]["ranks_data"] as $val%}
{%if $val@index > 0%}
<tr class="link" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/player/{%$val[5]|f_escape_xml%}">
<td width="10%">
<span {%if $val[0] == 1%} class="red num" {%else%} class="num" {%/if%}>{%$val[0]|f_escape_xml%}</span>
</td>
<td width="40%" align="left">
<span class="logo">
<img data-src="{%$val[2]|f_escape_xml%}" class="swiper-lazy"/>
{%if !empty($night)%}
<span class="mask"></span>
{%/if%}
</span>
<span class="name">{%$val[1]|f_escape_xml%}</span>
</td>
<td width="25%" align="center">{%$val[3]|f_escape_xml%}</td>
<td width="25%" align="center">{%$val[4]|f_escape_xml%}</td>
</tr>
{%/if%}
{%/foreach%}
{%else%}
<div class="mod-no-data" style="margin-top: 26px; padding-bottom: 350px;">暂无助攻榜数据</div>
{%/if%}
</tbody>
</table>
</section>
{%/if%}
</section>
</section>
</section>
{%require name='match:page/football_rank.tpl'%}{%/block%}
