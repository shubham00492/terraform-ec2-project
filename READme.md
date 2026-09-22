Terraform AWS EC2 - Remote Backend & Import | Hands-On
This repo shows my hands-on with Terraform provisioning an EC2 instance using variables, outputs, and best practices. Currently on local state, migrating to S3 remote backend with DynamoDB locking next.

Architecture
Local Machine (VS Code)
      |
      | terraform apply
      v
AWS Provider -> EC2 t3.micro (var.ami, var.instance_type)
      |
      |-- Outputs: instance_id, public_ip
      |
State: terraform.tfstate (local) -> Next: S3 Bucket + DynamoDB Lock
What I Implemented (Done)
Provider: AWS ap-south-1
EC2: t3.micro using var.ami and var.instance_type
Variables: Defined in variable.tf with type & description
Outputs: instance_id and public_ip in output.tf
Commands Practiced: fmt, validate, init, plan, apply, output, state list, destroy
.gitignore: Correctly ignoring .terraform/, *.tfstate, *.tfstate.backup
What is Next (To Do)
 Create S3 bucket: terraform-state-shubham-2026
 Create DynamoDB table: terraform-locks with LockID as partition key
 Add backend.tf for S3 remote backend
 terraform init -migrate-state to move local state to S3
 Import existing SG: terraform import aws_security_group.imported_sg sg-0acf255a1489333b7
Folder Structure
terraform-project/
├── main.tf          # EC2 resource
├── provider.tf      # AWS provider
├── variable.tf      # Input variables
├── output.tf        # Outputs
├── backend.tf       # S3 backend (coming soon)
├── .gitignore
└── README.md
How to Run
bash
# 1. Format & Validate
terraform fmt
terraform validate

# 2. Init & Plan
terraform init
terraform plan

# 3. Apply
terraform apply

# 4. Check Outputs
terraform output
terraform state list

# 5. Destroy
terraform destroy
Remote Backend (Next Step)
backend.tf will look like this:

hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-shubham-2026"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
Then: terraform init -migrate-state

Author
Shubham - Aspiring DevOps Engineer | AWS | Terraform | Linux