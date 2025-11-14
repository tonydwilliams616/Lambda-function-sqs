# 🚀 AWS SQS → Lambda → SNS Terraform Deployment

This repository contains a **modular Terraform configuration** and **GitHub Actions CI/CD pipeline** to deploy a **serverless message processing system** on AWS.

The setup uses:
- **SQS** as the message source
- **Lambda (Python 3.11)** to process and forward messages
- **SNS** to publish notifications (e.g., email alerts)
- **CloudWatch** for logging
- **GitHub OIDC** for secure, keyless Terraform deployments

---

## 🧠 Architecture

```text
GitHub Actions → AWS (OIDC Auth)
          │
          ▼
Terraform (modular)
          │
          ▼
SQS → Lambda → SNS → Email
           │
        CloudWatch