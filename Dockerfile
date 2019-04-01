FROM quay.io/ansible/molecule:latest
RUN pip install requests==2.20.1 docker docker-compose
