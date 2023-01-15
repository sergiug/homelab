# ansible-homelab

Ansible provisioning for a Ubuntu homelab server featuring: 
* Portainer
* Home Assistant

Everything running in docker containers.

## Prerequisites
### Homelab server(s)
* Ubuntu 22 server installed
* SSH key imported (I personally use github import right at installation time)

### Host machine
* Ansible installed
* sshpass installed (`sudo apt-get install sshpass`)


## Configuration
1. Customize hosts file according to your homelab server(s) names and IPs
2. Rename `/group_vars/all/secret.yaml.dist` file to `/group_vars/all/secret.yaml` and fill in with your details
3. Install community.docker ansible module 
`ansible-galaxy collection install community.docker`

## Run playbook
`ansible-playbook -i hosts main.yaml -kK`

Sit back and enjoy the homelab server being set up.