<section id="mergeTips">
<i class="tips-merge"></i><span>《{%$data|f_escape_xml%}》已被合并至当前帖子</span>
</section>
{%script%}
    var merge =require("bbs:widget/merge-info/merge-info.js");
	       merge.getStart();
{%/script%}