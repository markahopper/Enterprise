"Test slack-message":
  slack.post_message:
    - name: slack-message
    - channel: '#{{ pillar['slack']['channel'] }}'
    - from_name: {{ pillar['slack']['from_name'] }}
    - api_key: {{ pillar['slack']['api_key'] }}
    - message: 'This is a test message from {{ grains['fqdn'] }} -> minion {{ grains['id'] }}'
    
