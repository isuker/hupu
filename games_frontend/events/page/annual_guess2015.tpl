{%extends file="common/page/layout.tpl"%}

{%block name="title"%}2015虎扑年会竞猜{%/block%}

{%block name="head_static"%}
    {%require name="common:static/js/zepto/zepto.js"%}
    {%require name="common:static/js/underscore/underscore.js"%}
    {%require name="events:static/annual2016/annual2016.scss"%}
	{%script%}
		window.GM = {
			"glid": "{%$smarty.get.glid%}" || 5,
            "ggid": "{%$smarty.get.ggid%}" || "10001607"
		};
    {%/script%}
{%/block%}

{%block name="content"%}
	<div class="container">
	    <h2 class="title">{%if !empty($smarty.get.title)%}{%$smarty.get.title%}{%else%}虎扑年会{%/if%}</h2>
		{%widget
	        name="events:widget/annual_guess2015/annual_guess2015.tpl"
	    %}
    </div>
{%/block%}