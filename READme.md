<div align="center">

# 🏗️ Terraform AWS EC2 Deployment

### Infrastructure as Code | Remote State | State Locking

![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![S3](https://img.shields.io/badge/Amazon_S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)
![DynamoDB](https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazondynamodb&logoColor=white)

*A hands-on Terraform project that provisions an EC2 instance with a clean, variable-driven config — backed by S3 remote state and DynamoDB state locking.*

</div>

---

## 📖 Overview

This project automates the deployment of an **AWS EC2 instance** using **Terraform**, following infrastructure-as-code best practices:

- ✅ No hardcoded values — everything driven by variables
- ✅ Auto-generated outputs (Instance ID & Public IP)
- ✅ Remote state stored safely in **S3**
- ✅ State locking via **DynamoDB** to prevent team conflicts
- ✅ Clean, modular file structure

---

## 🧱 Architecture

```
                     ┌─────────────────────┐
                     │   Terraform CLI      │
                     └──────────┬───────────┘
                                │
              ┌─────────────────┼─────────────────┐
              ▼                                     ▼
     ┌─────────────────┐                 ┌──────────────────────┐
     │   AWS Provider    │                 │   S3 Bucket (State)   │
     │  (EC2 Instance)   │                 │  + DynamoDB (Lock)    │
     └─────────────────┘                 └──────────────────────┘
```

---

## 📁 Project Structure

| File            | Purpose                                                        |
|-----------------|------------------------------------------------------------------|
| `provider.tf`   | AWS provider config (region pulled from variables)              |
| `variable.tf`   | All input variables + descriptions                              |
| `ec2.tf`        | EC2 resource + S3 backend configuration                         |
| `output.tf`     | Outputs: `instance_id`, `public_ip`                              |
| `README.md`     | You're here 👋                                                   |

---

## ⚡ Quick Start

### 1️⃣ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- AWS CLI configured → `aws configure`
- IAM user with EC2 / S3 / DynamoDB permissions
- Pre-created S3 bucket (globally unique name) + DynamoDB table with partition key `LockID`

### 2️⃣ Clone & Configure

```bash
git clone <your-repo-url>
cd <repo-folder>
```

Update `variable.tf` (or add a `terraform.tfvars`) with your own AMI ID, instance type, key name, and region.

Update the backend block in `ec2.tf`:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}
```

### 3️⃣ Deploy

```bash
terraform init        # Initialize & connect to backend
terraform fmt          # Format code
terraform validate     # Validate syntax
terraform plan          # Preview changes
terraform apply         # Create resources 🚀
```

### 4️⃣ Verify

Check the **AWS EC2 Console** for your running instance, and the **S3 bucket** for your remote state file.

### 5️⃣ Clean Up

```bash
terraform destroy
```

---

## 🎯 Key Concepts Practiced

| Concept | Description |
|---|---|
| 🔧 **Variables** | Reusable, environment-agnostic configuration |
| 📤 **Outputs** | Auto-print key resource details after apply |
| ☁️ **Remote State** | State stored in S3 instead of locally |
| 🔒 **State Locking** | DynamoDB prevents concurrent `apply` conflicts |
| 🔁 **Standard Workflow** | `init` → `fmt` → `validate` → `plan` → `apply` |

---

## ⚠️ Security Note

No AWS credentials, `.tfstate` files, or real secrets are committed to this repo.

**Recommended `.gitignore`:**
```
*.tfstate
*.tfstate.backup
.terraform/
*.tfvars
```

---

<div align="center">

### 📌 Built as hands-on practice for mastering Terraform fundamentals on AWS

⭐ If you found this useful, consider giving it a star!

</div>