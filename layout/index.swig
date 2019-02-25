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

        {##### 判断文章分类中是否含有 gossip 分类 #####}
        {% set hasGossip = false %}
        {% for cat in post.categories %}
            {% if cat.name === "gossip" %}
                {% set hasGossip = true %}
            {% endif%}
        {% endfor %}
        {##### 首页不展示含有 gossip 分类的文章 #####}
        {% if !hasGossip %}
            {{ post_template.render(post, true) }}
        {% endif %}
       
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
