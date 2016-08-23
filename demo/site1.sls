# setup the pretty
{% set twilio_pic = salt['pillar.get']('nginx_background', '../img/bg5.jpg') %}
{% set title = salt['pillar.get']('nginx_title', 'Salted IIS') %}
{% set customer = salt['pillar.get']('nginx_customer_1', 'Salty the Cube') %}
{% set customer_subtitle = salt['pillar.get']('nginx_cust1sub', 'Get Salted') %}
{% set customer_image = salt['pillar.get']('nginx_cust1img', 'img/team/1.jpg') %}
{% set site = "WebApp1" %}
{% set sitefiles = "c:\websites" %}

# Stage site files
"WebApp1 stage files":
  file.recurse:
    - name: '{{ sitefiles }}\'
    - source: salt://iis/pretty
    - template: jinja
    - include_empty: True
    - defaults:
        back_pic: {{ twilio_pic }}
        web_title: {{ title }}
        cust_name: {{ customer }}
        cust_subtitle: {{ customer_subtitle }}
        cust_image: {{ customer_image }}
        ID: "{{ grains['id'] }}"
    - makedirs: True



