.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

init-provision: ## Run ansible-playbook for initilization
	ansible-playbook ./site.yml -i ./inventories/hosts --tags init -e ansible_ssh_user=root

provision: ## Run ansible-playbook
	ansible-playbook ./site.yml -i ./inventories/hosts --skip-tags init --ask-become-pass