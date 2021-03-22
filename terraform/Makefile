.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

fmt: ## Run terraform fmt
	terraform fmt -recursive

init: ## Run terraform init
	terraform init

validate: ## Run terraform validate
	find . -type f -name '*.tf' -exec dirname {} \; | sort -u | \
	xargs -I {} terraform validate {}
	
plan: ## Run terraform plan
	terraform plan

apply: ## Run terraform destroy.
	terraform apply

destroy: ## Run terraform destroy.
	terraform destroy

provision: ## Run ansible-playbook
	ansible-playbook ./ansible/site.yml -i ./ansible/inventories/hosts