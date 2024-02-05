#!/bin/bash

# Поднимаем необходимые контейнеры
docker-compose -f ../docker/docker-compose.yml up -d

# Запускаем Ansible playbook
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

# Останавливаем контейнеры
docker-compose -f ../docker/docker-compose.yml down
