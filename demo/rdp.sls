
{% if 'db' in grains['roles'] %}
{% set group = 'dba' %}
{% elif 'iis' in grains['roles'] %}
{% set group = 'webadmin' %}
{% endif %}

{% if group is defined %}
"Add AD Security Groups to Local Group":
  win_ad.groupadd:
    - name: {{ group }}
    - domain: saltstack.lab
    - group: "Remote Desktop Users"
{% endif %}