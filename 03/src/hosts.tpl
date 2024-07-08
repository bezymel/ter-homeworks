{% if web -%}
[web]
{% for instance in web %}
{{ instance.private_ip }}
{% endfor %}
{% endif %}

{% if database -%}
[database]
{% for instance in database %}
{{ instance.private_ip }}
{% endfor %}
{% endif %}

{% if storage -%}
[storage]
{% for instance in storage %}
{{ instance.private_ip }}
{% endfor %}
{% endif %}
