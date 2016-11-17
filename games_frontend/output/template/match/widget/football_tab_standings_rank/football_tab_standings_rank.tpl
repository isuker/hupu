{%**
*	小组赛：
*  	欧冠（chlg） 欧洲杯（eurocup） 美洲杯（amerciacup）(服务端单词拼错了，注意坑) 欧联（uefael）
*
*	非小组赛：
*   其他
*
*	特殊：
*	亚冠（afccl） 字段跟其他比赛不一样
*
*
**%}
{%if $league_name == "chlg" || $league_name == "eurocup" || $league_name == "amerciacup" || $league_name == "uefael"%}
<section class="standings-rank swiper-slide swiper-no-swiping" id="J-standings-rank">
<div class="main">
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
<table class="mod-title title">
<thead>
<tr>
<td width="10%" class="type">
{%if $val@index == 0%}A{%else if $val@index == 1%}B{%else if $val@index == 2%}C{%else if $val@index == 3%}D{%else if $val@index == 4%}E{%else if $val@index == 5%}F{%else if $val@index == 6%}G{%else if $val@index == 7%}H{%else if $val@index == 8%}I{%else if $val@index == 9%}J{%else if $val@index == 10%}K{%else if $val@index == 11%}L{%/if%}组</td>
<td width="35%" colspan="2" align="left">球队</td>
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
<tr class="link tap" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/team/{%$subVal.tid|f_escape_xml%}">
<td width="10%">
<span
								{%if $subVal.rank <= 2%}
								class="red-border num"
								{%else if $subVal.rank == 3 %}
									{%if $league_name == "chlg"%}
									class="yellow-border num"
									{%else if $league_name == "eurocup"%}
									class="red-border num"
									{%else%}
									class="num"
									{%/if%}
								{%else%}
								class="num"
								{%/if%}>{%$subVal.rank|f_escape_xml%}</span>
</td>
<td width="10%" align="left">
<span class="td-wrap"><span class="logo"><img {%if $league_name == "chlg"%}data-original="//b1.hoopchina.com.cn/games/teams/chlg/8_{%$subVal.tid|f_escape_xml%}.png?t={%$val@index|f_escape_xml%}{%$subVal@index|f_escape_xml%}"{%else%}data-original="{%$subVal.logo|f_escape_xml%}?t={%$val@index|f_escape_xml%}{%$subVal@index|f_escape_xml%}"{%/if%} class="lazy" width="28" /></span>
</td>
<td width="25%" align="left">
<span class="name">{%$subVal.name|f_escape_xml%}</span></span>
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
<div class="mod-no-data">暂无积分榜数据</div>
{%/if%}
</div>
</section>
{%else if $league_name == "afccl"%}
<section class="standings-rank swiper-slide swiper-no-swiping" id="J-standings-rank">
<div class="main">
{%if !empty($against_figure)%}
{%widget
		        name="match:widget/vs_soccer/vs_soccer.tpl"
		        leagueName="afccl"
		    %}
{%/if%}
{%if !empty($rank[0]["ranks_data"])%}
{%foreach $rank[0]["ranks_data"] as $val%}
<table class="mod-title title">
<thead>
<tr>
<td width="10%" class="type">
{%if $val@index == 0%}A{%else if $val@index == 1%}B{%else if $val@index == 2%}C{%else if $val@index == 3%}D{%else if $val@index == 4%}E{%else if $val@index == 5%}F{%else if $val@index == 6%}G{%else if $val@index == 7%}H{%/if%}组</td>
<td width="35%" colspan="2" align="left">球队</td>
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
<tr class="link tap" {%if $val@index == 3 && $subVal@index == 3%}id="movetochina"{%/if%} link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/team/{%$subVal.tid|f_escape_xml%}">
<td width="10%">
<span
								{%if $subVal.ranking <= 2%}
								class="red-border red num"
								{%else%}
								class="num"
								{%/if%}>{%$subVal.ranking|f_escape_xml%}</span>
</td>
<td width="10%" align="left">
<span class="td-wrap"><span class="logo"><img data-original="{%$subVal.team_logo|f_escape_xml%}?t={%$val@index|f_escape_xml%}{%$subVal@index|f_escape_xml%}" width="28" class="lazy" /></span>
</td>
<td width="25%" align="left">
<span class="name">{%$subVal.team_name|f_escape_xml%}</span></span>
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
<div class="mod-no-data">暂无积分榜数据</div>
{%/if%}
</div>
</section>
{%else%}
<section class="standings-rank swiper-slide swiper-no-swiping" id="J-standings-rank">
<div class="main">
<table class="mod-title">
<thead>
<tr>
<td width="10%" class="type">排名</td>
<td width="35%" colspan="2" align="left">球队</td>
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
<tr class="link tap" link="kanqiu://soccerleagues/{%$league_name|f_escape_xml%}/team/{%$val.team_id|f_escape_xml%}">
<td width="10%">
{%if $league_name == "seri"%}
<span
									{%if $val.ranking <= 3%}
									class="red num"
									{%else if $val.ranking == 4 || $val.ranking == 5%}
									class="yellow num"
									{%else if $val.ranking >= count($rank[0]["ranks_data"])-2%}
									class="green num"
									{%else%}
									class="num"
									{%/if%}>{%$val.ranking|f_escape_xml%}</span>
{%else if $league_name == "fran"%}
<span
									{%if $val.ranking <= 3%}
									class="red num"
									{%else if $val.ranking == 4 %}
									class="yellow num"
									{%else if $val.ranking >= count($rank[0]["ranks_data"])-2%}
									class="green num"
									{%else%}
									class="num"
									{%/if%}>{%$val.ranking|f_escape_xml%}</span>
{%else if $league_name == "liga" || $league_name == "bund" || $league_name == "epl"%}
<span
									{%if $val.ranking <= 4%}
									class="red num"
									{%else if $val.ranking == 5 || $val.ranking == 6%}
									class="yellow num"
									{%else if $val.ranking >= count($rank[0]["ranks_data"])-2%}
									class="green num"
									{%else%}
									class="num"
									{%/if%}>{%$val.ranking|f_escape_xml%}</span>
{%else if $league_name == "csl"%}
<span
									{%if $val.ranking <= 4%}
									class="red num"
									{%else if $val.ranking >= count($rank[0]["ranks_data"])-1%}
									class="green num"
									{%else%}
									class="num"
									{%/if%}>{%$val.ranking|f_escape_xml%}</span>
{%else if $league_name == "csl_zj"%}
<span
									{%if $val.ranking <= 2%}
									class="red num"
									{%else if $val.ranking >= count($rank[0]["ranks_data"])-1%}
									class="green num"
									{%else%}
									class="num"
									{%/if%}>{%$val.ranking|f_escape_xml%}</span>
{%/if%}
</td>
<td width="10%" align="left">
<span class="td-wrap"><span class="logo"><img data-original="{%$val.team_logo|f_escape_xml%}?t={%$val@index|f_escape_xml%}" width="28" class="lazy" /></span>
</td>
<td width="25%" align="left">
<span class="name">{%$val.team_name|f_escape_xml%}</span></span>
</td>
<td width="10%" align="center">{%$val.played|f_escape_xml%}</td>
<td width="7%" align="center">{%$val.wins|f_escape_xml%}</td>
<td width="7%" align="center">{%$val.ties|f_escape_xml%}</td>
<td width="7%" align="center">{%$val.losses|f_escape_xml%}</td>
<td width="14%" align="center">{%$val.goalsFor_goalsAgainst|f_escape_xml%}</td>
<td width="10%" align="center">{%$val.points|f_escape_xml%}</td>
</tr>
{%/foreach%}
{%else%}
<div class="mod-no-data">暂无积分榜数据</div>
{%/if%}
</tbody>
</table>
{%if $league_name != "csl_zj"%}
<p class="notice">比赛进行中，您将看到依据各支球队实时进球调整的动态排名，这可能与比赛结束后的积分榜排序稍有不同。</p>
{%/if%}
</div>
</section>
{%/if%}
