#Firewall config for windows website




#"Setup DNS":
#  win_dns_client.dns_exists:
#    - replace: 
#    - interface: 'Ethernet'
#    - servers:
#      - {{ pillar['ad']['dns'] }}

"Reboot after name change":
  module.run:
    - name: system.reboot
    - timeout: 1
    - in_seconds: True
    - onchanges:
      - win_ad: "Change computer name"

"Change computer name":
  win_ad.computer_name:
    - name: {{ grains.id }}