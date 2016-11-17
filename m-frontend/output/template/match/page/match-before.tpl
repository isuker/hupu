{%extends file="common/page/layout.tpl"%} 
{%block name="block_head_static"%}
{%require name="match:static/match-live/match-live.scss"%}
{%script%}
        require("match:widget/match-info/match-info.js")
    {%/script%}
{%/block%}
{%block name="content"%}
{%widget
        name="common:widget/top-nav/top-nav.tpl"
    %}
{%widget
        name="match:widget/match-info/match-info.tpl"
    %}
<table class="team-summary">
<tr>
<th class="item1">联盟排名</th>
<th>{%$gameInfo.away.name|f_escape_xml%}</th>
<th>{%$gameInfo.home.name|f_escape_xml%}</th>
</tr>
{%$data=["pts","reb","ast","tno","lts"]%}
{%$tabNames=[
            "pts"=>"场均得分",
            "reb"=>"场均篮板",
            "ast"=>"场均助攻",
            "tno"=>"场均失误",
            "lts"=>"场均失分"
        ]%}{%if !empty($teamRankInfo["home"])%}
{%foreach from=$data item=item%}
<tr>
<td class="item1">{%$tabNames[$item]|f_escape_xml%}</td>
<td>{%$teamRankInfo["away"][$item]|f_escape_xml%}</td>
<td>{%$teamRankInfo["home"][$item]|f_escape_xml%}</td>
</tr>
{%/foreach%}
{%/if%}
</table>
{%require name='match:page/match-before.tpl'%}{%/block%}