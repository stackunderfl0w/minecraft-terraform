# minecraft-terraform

This guide will help you set up a Minecraft server on an AWS EC2 instance.

Loosly based on

https://raspberrytips.com/install-minecraft-server-debian/

https://developer.hashicorp.com/terraform/tutorials/aws-get-started

https://aws.amazon.com/blogs/gametech/setting-up-a-minecraft-java-server-on-amazon-ec2/


## Prerequisites

- An AWS account
- AWS cli & credentials
- Terraform
- Ansible

## Step 1: Create and Launch an EC2 Instance
- Initialize terraform and apply the configuration
   ```bash
   terraform init
   terraform apply
   ```

## Step 2: Setup Minecraft Server
- Copy the ip adress output by the terraform script
   ```bash
   ansible-playbook -i ip, minecraft_playbook.yml
   ```