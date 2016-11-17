{%if !empty($commentsCount) %}
<div class="m-reply" id="J_replyContent">
{%if !empty($lightComments) %}
<div class="bright-reply">
<div class="title">
<h2>这些评论亮了</h2>
</div>
<div class="reply-inner">
{%foreach from=$lightComments item=lComVal name=lComKey%}
{%widget
                            name="news:widget/reply/reply-list.tpl"
                            data=$lComVal
                        %}
{%/foreach%}
</div>
</div>
{%/if%}
<section class="m-card-split-line" id="u2740418">
{%$adInfo.m_partner.m_news_detail_bright_reply_downside.adcode|escape:none%}
</section>
{%if !empty($commentsInfo)%}
<div class="newest-reply {%if empty($username)%}newest-reply-notlogin{%/if%}" data-pagecount="{%$pageCount|f_escape_xml%}">
<div class="title">
<h2>最新评论</h2>
</div>
<div class="reply-inner">
{%foreach from=$commentsInfo item=itemVal name=itemVal%}
{%widget
                            name="news:widget/reply/reply-list.tpl"
                            data=$itemVal
                        %}
{%/foreach%}
</div>
<div class="button-inner">
{%if $commentsCount > 5%}
<a href="javascript:" dace-node="{%$id4dace|f_escape_xml%}_readMoreComment" class="button-viewMore" id="J_buttonViewMore" data-page="{%$page|f_escape_xml%}">查看全部评论</a>
{%else%}
<span class="finish-loading">暂无更多评论</span>
{%/if%}
</div>
</div>
{%/if%}
</div>
{%/if%}
{%widget
    name="news:widget/reply/popup-reply.tpl"
%}
{%script%}
    var reply = require("news:widget/reply/reply.js");
    reply.init();
{%/script%}
