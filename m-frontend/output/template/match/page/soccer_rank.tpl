{%extends file="common/page/layout.tpl"%} 
{%block name="block_head_static"%}
{%require name="match:static/soccer-rank/soccer-rank.scss"%}
{%script%}
		$(".mod-table").delegate(".link", "click", function(e){
			var link = $(e.currentTarget).attr("link");
			location.href = link;
		})
		{%/script%}
{%/block%}
{%block name="content"%}
{%widget
		name="common:widget/top-nav/top-nav.tpl"
%}
<section class="mod-rank-wrap">
<section class="swiper-container">
<section class="swiper-wrapper">
<section class="standings-rank swiper-slide" id="J-standings-rank" style="padding-top:0">
{%if !empty($AgainstInfo)%}
{%widget
                name="match:widget/vs_soccer_data/vs_soccer_data.tpl"
                leagueName=$leagueName
            %}
{%/if%}
{%if !empty($rankInfo)%}
{%foreach $rankInfo as $val%}
<table class="mod-title title">
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
<tr class="link" link="{%$subVal.url|f_escape_xml%}">
<td width="10%">
<span
											{%if $subVal.rank_index <= 2%}
											class="red-border num"
											{%else if $subVal.rank_index == 3 %}
											class="yellow-border num"
											{%else%}
											class="num"
											{%/if%}>{%$subVal.rank_index|f_escape_xml%}</span>
</td>
<td width="35%" align="left">
<span class="td-wrap"><span class="logo"><img src="{%$subVal.home_logo|f_escape_xml%}?{%$subVal@index|f_escape_path%}" class="swiper-lazy" width="28" /></span><span class="name">{%$subVal.name_zh|f_escape_xml%}</span></span>
</td>
<td width="10%" align="center">{%$subVal.played|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.win|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.draw|f_escape_xml%}</td>
<td width="7%" align="center">{%$subVal.lost|f_escape_xml%}</td>
<td width="14%" align="center">{%$subVal.hits|f_escape_xml%}/{%$subVal.miss|f_escape_xml%}</td>
<td width="10%" align="center">{%$subVal.score|f_escape_xml%}</td>
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
</section>
</section>
</section>
{%require name='match:page/soccer_rank.tpl'%}{%/block%}
