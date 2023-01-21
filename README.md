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
We are running Ansible in a docker container, to be able to run from any host, so only prerequisite required on the host is Docker installed.
* Docker


## Configuration
1. Rename `hosts.dist` to `hosts` and fill in with your details, server IPs, etc..
2. 

## Running the linting tools
`make lint`

## Checking the playbook (running in dry mode)
`make check`

## Running the playbook
`make play`

Sit back and enjoy the homelab server being set up.