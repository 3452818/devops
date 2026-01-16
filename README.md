# devops

# Install terraform and Yandex Console

	curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
	exec -l $SHELL

	yc init
	
	yc config list
					Ïðèìåð! 
					mitin@vm:~$ yc config list
												
					token: y0__xC*******JEBs6Gb4OTDA
					cloud-id: b1g************nceoda
					folder-id: b1gljt*******0mq86dmi
					compute-default-zone: ru-central1-a

	
 # Install terraform
	wget https://hashicorp-releases.yandexcloud.net/terraform/1.10.0/terraform_1.10.0_linux_amd64.zip
	wget https://hashicorp-releases.yandexcloud.net/terraform-provider-yandex/0.116.0/terraform-provider-yandex_0.116.0_linux_amd64.zip
	
	unzip terraform_1.10.0_linux_amd64.zip terraform-provider-yandex_0.116.0_linux_amd64.zip  /usr/local/bin/
	nano ~/.terraformrc # instruction https://yandex.cloud/ru/docs/ydb/terraform/install?utm_referrer=https%3A%2F%2Fyandex.ru%2F
	
	
	
# Init terraform 

	terraform init

	terraform --version

 # Check configuration terraform
	terraform plan -var-file=terraform.tfvar
 # Apply configuration terraform
	terraform apply-var-file=terraform.tfvar
	
Result:	
k8s_app_ip = "178.154.229.52"
k8s_master_ip = "178.154.230.112"
srv_ip = "178.154.228.207"



 # Generate SSH key

ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""  

 ssh ubuntu@178.154.229.52 # check
 
 # Install ansible
ubuntu@fhm7lfo5lj1o4t2h6nco: sudo sudo apt install ansible

 # Apply  ansible playbook
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
ubuntu@fhm7lfo5lj1o4t2h6nco:~$ cd devops/ansible/
ubuntu@fhm7lfo5lj1o4t2h6nco:~/devops/ansible$ ansible-playbook -i inventory.ini playbook.yml

ansible-playbook kube_dependencies.yml -i inventory.ini

