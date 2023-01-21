.PHONY: $($(MAKECMDGOALS))
ifeq ($(OS),Windows_NT)
    OS := Windows
	USER_HOME = ${USERPROFILE}
	CURRENT_PATH = ${CURDIR}
else
    OS := $(shell uname)  # same as "uname -s"
	USER_HOME = ${HOME}
	CURRENT_PATH = ${PWD}
endif

DOCKER=docker
ANSIBLE_CLI_IMAGE = docker/ansible-cli
DOCKER_ANSIBLE_CLI = ${DOCKER} run -t --rm --mount type=bind,src=${USER_HOME}/.ssh,dst=/root/.ssh --mount type=bind,src=${CURRENT_PATH}/.ansible.cfg,dst=/root/.ansible.cfg --mount type=bind,src=${CURDIR}/,dst=/ansible/ --workdir /ansible ${ANSIBLE_CLI_IMAGE} sh -c

build:
	$(DOCKER) build . -t docker/ansible-cli

lint:
	${DOCKER_ANSIBLE_CLI} "ansible-lint main.yaml"

check:
	${DOCKER_ANSIBLE_CLI} "ansible-playbook -i hosts main.yaml --check"

play:
	${DOCKER_ANSIBLE_CLI} "ansible-playbook -i hosts main.yaml"