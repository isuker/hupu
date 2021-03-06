{%extends file="common/page/layout.tpl"%} 
{%block name="head_static"%}
{%require name="team:static/teamList/teamList.css"%}
{%require name="team:static/teamList/teamList.js"%}
{%/block%}
{%block name="content"%}
<div class="gamecenter_livestart">
<div class="bgs_png" style="display:none;"></div>
{%widget name="common:widget/ad-980/ad-980.tpl"%}
{%widget name="common:widget/page-tab/page-tab.tpl" title="球队"%}
<div class="gamecenter_content">
<div class="teamlist_box clearfix">
<div class="teamlist_box_l">西部</div>
<div class="teamlist_box_r">
{%foreach $team_list as $val%}
{%if $val@index < 3%}
<div class="all">
<div class="a"><span class="">{%$val.division|f_escape_xml%}</span></div>
<div class="team">
{%foreach $val.team_list as $subVal%}
<a href="{%$subVal.info_link|f_escape_xml%}" target="_blank" class="a_teamlink">
<div class="box">
<div class="img"><img src="{%$subVal.logo|f_escape_xml%}"></div>
<div class="font">
<h2>{%$subVal.name|f_escape_xml%}</h2>
<p>({%$subVal.win|f_escape_xml%}胜{%$subVal.lost|f_escape_xml%}负)</p>
</div>
</div>
</a>
{%/foreach%}
</div>
</div>
{%/if%}
{%/foreach%}
</div>
</div>
<div class="teamlist_box clearfix">
<div class="teamlist_box_l">东部</div>
<div class="teamlist_box_r">
{%foreach $team_list as $val%}
{%if $val@index >= 3%}
<div class="all">
<div class="a"><span class="">{%$val.division|f_escape_xml%}</span></div>
<div class="team">
{%foreach $val.team_list as $subVal%}
<a href="{%$subVal.info_link|f_escape_xml%}" target="_blank" class="a_teamlink">
<div class="box">
<div class="img"><img src="{%$subVal.logo|f_escape_xml%}"></div>
<div class="font">
<h2>{%$subVal.name|f_escape_xml%}</h2>
<p>({%$subVal.win|f_escape_xml%}胜{%$subVal.lost|f_escape_xml%}负)</p>
</div>
</div>
</a>
{%/foreach%}
</div>
</div>
{%/if%}
{%/foreach%}
</div>
</div>
</div>
</div>
{%require name='team:page/teamList.tpl'%}{%/block%}
