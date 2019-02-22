{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ title }}{% if theme.index_with_subtitle and subtitle %} – {{ subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
    
        {##### 同一文章可能没有分类，直接渲染 #####}
        {% if not post.categories.length %}
            {{ post_template.render(post, true) }}
        {% else %}
            {##### 同一文章可能有多个分类，遍历，如果是 gossip 则不在主页渲染 #####}
            {##### 不能在内层循环渲染文章，否则文章会重复 #####}
            {##### swig不支持 break，continue 只能曲线救国啊 #####}
            {% set break_out = false %}
            {% for cat in post.categories %}
                {% if cat.name !== "gossip" and not break_out %}

                    {{ post_template.render(post, true) }}
                    {##### 相同文章只渲染一次 #####}
                    {% set break_out = true %}
                {% endif%}
            {% endfor %}
        {% endif %}
       
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
