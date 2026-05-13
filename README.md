# Terraform AWS Infrastructure

Production-style AWS infrastructure provisioned with Terraform using modular design.

## Architecture

- **VPC** — Custom VPC with public and private subnets across 2 AZs
- **Security Groups** — Separate SGs for ALB, EC2, RDS with least privilege
- **IAM** — EC2 instance role with scoped S3 access
- **EC2** — Auto Scaling Group with launch template in private subnet
- **ALB** — Application Load Balancer in public subnet with health checks
- **RDS** — PostgreSQL 16.6 in private subnet, no public access
- **Remote State** — S3 backend with DynamoDB state locking

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI v2
- AWS credentials configured

## Usage

\`\`\`bash
# Initialize
terraform init

# Preview changes
terraform plan

# Apply
terraform apply

# Destroy
terraform destroy
\`\`\`

## Modules

| Module | Description |
|--------|-------------|
| vpc | VPC, subnets, IGW, route tables |
| security-groups | ALB, EC2, RDS security groups |
| iam | EC2 IAM role and instance profile |
| ec2 | Launch template and Auto Scaling Group |
| alb | Application Load Balancer and target group |
| rds | PostgreSQL RDS instance |

## Remote State

State is stored in S3 bucket `terraform-state-ahefaz` with DynamoDB locking.

## Outputs

| Output | Description |
|--------|-------------|
| vpc_id | VPC ID |
| alb_dns_name | ALB public DNS |
| rds_endpoint | RDS connection endpoint |
