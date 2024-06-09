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

## Requirements

- AWS CLI: Ensure you have the AWS CLI installed and configured with your credentials.
- Terraform: Install Terraform on your local machine.
- Ansible: Install Ansible for configuration management.

## Overview
- Initialize and Apply Terraform Configuration: Deploy the EC2 instance and other necessary AWS resources.
- Run Ansible Playbook: Configure the Minecraft server on the deployed EC2 instance.
- Connect to Minecraft Server: Verify the server is running and accessible.

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

## Step 3: Connecting to the Minecraft Server

- Once the server is configured, you can connect to it using the Minecraft client with the public IP address of the EC2 instance.

- To verify the server is running, use the following command
   
   ```bash
   nmap -sV -Pn -p T:25565 <instance_public_ip>   
   ```
- You can also connect to the server in game by entering the ip adress output by the terraform script as the server ip.
