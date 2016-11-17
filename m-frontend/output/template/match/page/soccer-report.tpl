{%extends file="common/page/layout.tpl"%} 
{%block name="block_head_static"%}
{%require name="match:static/match-report/match-report.scss"%}
{%script%}
        require("match:widget/top-tips/top-tips.js");
    {%/script%}
{%/block%}
{%block name="content"%}
{%widget
        name="common:widget/top-nav/top-nav.tpl"
    %}
{%assign var=top value=$adInfo.m_adword.nba_game_playbyplay%}
{%widget
        name="match:widget/top-tips/top-tips.tpl"
        isOpen=$top.isopen
        content=$top.adword
        url=$top.adurl
    %}
{%widget
        name="match:widget/soccer-header/soccer-header.tpl"
    %}
{%widget
        name="common:widget/inner-tab/tab.tpl"
        tabClass="soccermatch"
        selected="战报"
    %}
<section class="report-wrap">
<article class="article-content">
{%$gameRecap|escape:none%}
</article>
</section>
{%require name='match:page/soccer-report.tpl'%}{%/block%}