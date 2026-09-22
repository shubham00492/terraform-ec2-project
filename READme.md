# Terraform AWS EC2 - Complete Hands-On

Provisioned EC2 using Terraform from local VS Code, pushed to GitHub repo `terraform-ec2-project`, then launched 2nd EC2 via Terraform from within 1st EC2 using IAM Role - Full DevOps workflow.

## Architecture

```
Local (VS Code - terraform-ec2-project) -> GitHub (terraform-ec2-project) -> EC2 (shubham) -> IAM Role (shubham-terraform-git) -> Terraform Apply -> 2nd EC2 (Terraform-VSCode-EC2)
```

## What I Did - Step by Step

1. **Launched EC2 `shubham`** - t3.micro, Ubuntu 26.04 LTS (ami-091138d0f0d41ff90) in us-east-1
2. **Wrote `ec2.tf` in VS Code** - inside `terraform-ec2-project` folder with provider aws + resource aws_instance
3. **Pushed to GitHub** - Repo: `terraform-ec2-project` (Public) - Fixed HTTP 408 error by adding .terraform/ to .gitignore
4. **SSH into EC2** - Via AWS CloudShell using shub.pem key (Public IP: 13.217.142.249)
5. **Attached IAM Role** - `shubham-terraform-git` via Actions > Security > Modify IAM Role
6. **Installed Terraform v1.15.5** on EC2 from HashiCorp repo
7. **Cloned repo and ran `terraform apply`** - Successfully launched 2nd EC2 `Terraform-VSCode-EC2`

## Proof Screenshots - 18 Images

All screenshots are in `/screenshots` folder of `terraform-ec2-project` repo.

- Launch Instance page (Name: shubham, t3.micro)
- EC2 Running (i-05b0853f652f0157a)
- ec2.tf in VS Code (terraform-ec2-project)
- Git push with 408 error and fix
- SSH success into Ubuntu
- Git clone on EC2
- Modify IAM Role steps
- Terraform install (v1.15.5)
- terraform init, plan, apply creating 2nd EC2

## Tech Stack

- Terraform v1.15.5
- AWS EC2 t3.micro
- Ubuntu 26.04 LTS (ami-091138d0f0d41ff90)
- Git & GitHub - Repo: terraform-ec2-project
- IAM Roles & Instance Profile
- AWS CloudShell

## Project Structure

```
terraform-ec2-project/
├── ec2.tf
├── .gitignore
├── README.md
└── screenshots/
    ├── screenshot_1.png to screenshot_18.png
```

## Commands Used

```bash
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
terraform state list
terraform output
terraform destroy
```

## Key Learning

- How to use IAM Role instead of hardcoded AWS keys (Best Practice)
- How to fix GitHub push 408 error with .gitignore
- Full workflow: Local (terraform-ec2-project) -> GitHub -> EC2 -> Terraform -> New Resource

## Author
Shubham - Aspiring DevOps Engineer | AWS | Terraform
GitHub Repo: terraform-ec2-project (Public)
