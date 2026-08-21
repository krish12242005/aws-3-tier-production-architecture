# 🚀 AWS 3-Tier Production Architecture

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure-purple)
![Linux](https://img.shields.io/badge/Linux-Administration-black)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue)
![Architecture](https://img.shields.io/badge/Architecture-3--Tier-green)

> A production-style, highly available AWS 3-Tier Architecture built using Terraform and AWS networking best practices.

---

## 🏗️ Architecture

```text
                         INTERNET
                            │
                            ▼
                  ┌──────────────────┐
                  │ Internet Gateway │
                  └────────┬─────────┘
                           │
                ┌──────────┴──────────┐
                │                     │
          Public Subnet AZ-A    Public Subnet AZ-B
                │                     │
                └──────────┬──────────┘
                           │
                  ┌────────▼────────┐
                  │ Application ALB │
                  └────────┬────────┘
                           │
                ┌──────────┴──────────┐
                │                     │
          Private App AZ-A      Private App AZ-B
                │                     │
              EC2-1                 EC2-2
                │                     │
                └──────────┬──────────┘
                           │
                    Private DB Tier
                           │
                  ┌────────▼────────┐
                  │ PostgreSQL RDS  │
                  │    Multi-AZ     │
                  └─────────────────┘