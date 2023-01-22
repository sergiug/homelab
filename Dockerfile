FROM ubuntu:22.04

ENV ANSIBLE_CORE="2.10"
ENV ANSIBLE_LINT="6.11"

RUN apt-get update && \
    apt-get install -y gnupg2 python3-pip sshpass git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible-base==${ANSIBLE_CORE} && \
    pip install mitogen ansible-lint==${ANSIBLE_LINT} jmespath && \
    pip install --upgrade pywinrm && \
    pip install --upgrade paramiko && \
    rm -rf /root/.cache/pip \

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

RUN ansible-galaxy collection install community.docker && \
    ansible-galaxy collection install community.general

CMD [ "ansible-playbook", "--version" ]