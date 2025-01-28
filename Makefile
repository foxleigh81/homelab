# Variables
ANSIBLE_PLAYBOOK := ansible-playbook
ANSIBLE_GALAXY := ansible-galaxy
TERRAFORM := terraform
INVENTORY := ansible/inventories/foxnet.ini
PLAYBOOK := ansible/playbooks/setup.yml
TERRAFORM_DIR := servers/arctic/terraform

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
ansible-playbook:
	$(ANSIBLE_PLAYBOOK) -i $(INVENTORY) $(PLAYBOOK)

ansible-galaxy:
	$(ANSIBLE_GALAXY) install -r ansible/requirements.yml

# Combined Tasks
setup: ansible-galaxy ansible-playbook
infra: tf-init tf-plan tf-apply