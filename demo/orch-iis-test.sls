
"Deploy initial setup states":
  salt.state:
    - tgt: 'demo-iis1,demo-iis2'
    - tgt_type: list
    - sls:
      - sync
      - demo.network

wait_for_reboots:
  salt.wait_for_event:
    - name: salt/minion/*/start
    - id_list:
      - demo-iis1
      - demo-iis2

"Send IIS message to slack":
  salt.state:
    - tgt: 'vm-master'
    - sls:
      - slack.blast
    - pillar:
        mymessage: "New IIS Servers have been deployed"

"Add Servers to AD":
  salt.state:
    - tgt: 'demo-iis1,demo-iis2'
    - tgt_type: list
    - sls:
      - demo.addtodomain

"Wait for AD Reboot":
  salt.wait_for_event:
    - name: salt/minion/*/start
    - id_list:
      - demo-iis1
      - demo-iis2