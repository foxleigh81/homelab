# Variables
ANSIBLE_PLAYBOOK := ansible-playbook
ANSIBLE_GALAXY := ansible-galaxy
TERRAFORM := terraform
TERRAFORM_DIR := servers/arctic/terraform
ANSIBLE_DIR := ansible

# Terraform Commands
tf-init:
	cd $(TERRAFORM_DIR) && $(TERRAFORM) init

tf-plan:
	cd $(TERRAFORM_DIR) && $(TERRAFORM) plan

tf-apply:
	cd $(TERRAFORM_DIR) && $(TERRAFORM) apply -auto-approve

tf-destroy:
	cd $(TERRAFORM_DIR) && $(TERRAFORM) destroy -auto-approve

tf-clean:
	rm -rf $(TERRAFORM_DIR)/.terraform
	rm -f $(TERRAFORM_DIR)/terraform.tfstate*

# Ansible Commands
arctic:
	cd $(ANSIBLE_DIR) && $(ANSIBLE_PLAYBOOK) arctic.yml
grey:
	cd $(ANSIBLE_DIR) && $(ANSIBLE_PLAYBOOK) grey.yml

galaxy:
	$(ANSIBLE_GALAXY) install -r ansible/requirements.yml

vault:
	cd $(ANSIBLE_DIR) && ansible-vault view vars/secrets.yml

vault-edit:
	cd $(ANSIBLE_DIR) && ansible-vault edit vars/secrets.yml

# Combined Tasks
setup: galaxy playbook
infra: tf-init tf-plan tf-apply