.PHONY: $($(MAKECMDGOALS))

lint:
	ansible-lint main.yaml

check:
	ansible-playbook -i hosts main.yaml -kK --check

play:
	ansible-playbook -i hosts main.yaml -kK