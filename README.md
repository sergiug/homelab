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

The current setup assumes that the private key for accessing the homelab servers exists in your users home directory, which is mounted into the docker container (check `--mount type=bind,src=${USER_HOME}/.ssh,dst=/root/.ssh` in `Makefile`)

## Configuration
1. Rename `hosts.dist` to `hosts` and fill in with your details, server IPs, etc..

## Running the linting tools
`make lint`

## Checking the playbook (running in dry mode)
`make check`

## Running the playbook
`make play`

Sit back and enjoy the homelab server being set up.