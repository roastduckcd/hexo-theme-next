{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{### 注释：新增引入模板 ###}
{% import '_macro/post.swig' as post_gossip %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ title }}{% endblock %}

{% block content %}

  {######################}
  {### CATEGORY BLOCK ###}
  {######################}
  <div class="post-block category">
    {##### 点击某个分类，页面中会展示 xxx 分类 的字段，gossip 分类下就不展示了 ######}
    {% if page.category !== "gossip" %}
    <div id="posts" class="posts-collapse">
      <div class="collection-title">
        <{% if theme.seo %}h2{% else %}h1{% endif %}>{#
        #}{{ page.category }}{#
        #}<small>{{  __('title.category')  }}</small>
        </{% if theme.seo %}h2{% else %}h1{% endif %}>
      </div>
    {% endif %}

      {% for post in page.posts %}
       {###### gossip 分类使用 post.swig渲染，其他的使用post_collapse.swig渲染 ######}
       {% if page.category === "gossip" %}
         {{ post_gossip.render(post, true) }}
       {% else %}
         {{ post_template.render(post, true) }}
       {% endif %}

      {% endfor %}
    </div>

  </div>
  {##########################}
  {### END CATEGORY BLOCK ###}
  {##########################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
