# devops

# Установка terraform и Yandex Console

	curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
	exec -l $SHELL

	yc init
	
	yc config list
					Пример! 
					mitin@vm:~$ yc config list
												
					token: y0__xC*******JEBs6Gb4OTDA
					cloud-id: b1g************nceoda
					folder-id: b1gljt*******0mq86dmi
					compute-default-zone: ru-central1-a

	
 # Установка  и настройка terraform
	wget https://hashicorp-releases.yandexcloud.net/terraform/1.10.0/terraform_1.10.0_linux_amd64.zip
	wget https://hashicorp-releases.yandexcloud.net/terraform-provider-yandex/0.116.0/terraform-provider-yandex_0.116.0_linux_amd64.zip
	
	unzip terraform_1.10.0_linux_amd64.zip terraform-provider-yandex_0.116.0_linux_amd64.zip  /usr/local/bin/
	nano ~/.terraformrc # https://yandex.cloud/ru/docs/ydb/terraform/install?utm_referrer=https%3A%2F%2Fyandex.ru%2F
	
	
	
# Инициализация terraform 

	terraform init

	terraform --version

 # Проверка создаваемой конфигурации
	terraform plan -var-file=terraform.tfvar
 # Создание конфигурации
	terraform apply-var-file=terraform.tfvar
	
	
k8s_app_ip = "178.154.229.52"
k8s_master_ip = "178.154.230.112"
srv_ip = "178.154.228.207"


srv_ip: sudo sudo apt install ansible

ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""  # закинуть на все сервера

 ssh ubuntu@178.154.229.52



cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
ubuntu@fhm7lfo5lj1o4t2h6nco:~$ cd devops/ansible/
ubuntu@fhm7lfo5lj1o4t2h6nco:~/devops/ansible$ ansible-playbook -i inventory.ini playbook.yml



ansible-playbook kube_dependencies.yml -i inventory.ini

