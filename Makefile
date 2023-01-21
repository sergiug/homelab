.PHONY: $($(MAKECMDGOALS))

DOCKER=docker
ANSIBLE_CLI_IMAGE = docker/ansible-cli
DOCKER_ANSIBLE_CLI = ${DOCKER} run -t --rm --mount type=bind,src=${USERPROFILE}/.ssh,dst=/root/.ssh --mount type=bind,src=${CURDIR}/.ansible.cfg,dst=/root/.ansible.cfg --mount type=bind,src=${CURDIR}/,dst=/ansible/ --workdir /ansible ${ANSIBLE_CLI_IMAGE} sh -c

build:
	$(DOCKER) build . -t docker/ansible-cli

lint:
	${DOCKER_ANSIBLE_CLI} "ansible-lint main.yaml"

check:
	${DOCKER_ANSIBLE_CLI} "ansible-playbook -i hosts main.yaml --check"

play:
	${DOCKER_ANSIBLE_CLI} "ansible-playbook -i hosts main.yaml -kK"