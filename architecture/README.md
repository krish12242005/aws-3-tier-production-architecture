\# 🏗️ AWS 3-Tier Production Architecture



\## Architecture Diagram



!\[AWS 3-Tier Production Architecture](./architecture-diagram.png)



\---



\## 📐 Architecture Overview



This project implements a production-style AWS 3-Tier Architecture using Terraform.



The architecture is divided into three major layers:



\### 1. 🌐 Presentation / Load Balancing Layer



\- Application Load Balancer

\- Public Subnets

\- Internet Gateway

\- Multi-AZ deployment



\### 2. ⚙️ Application Layer



\- EC2 application servers

\- Private Application Subnets

\- Multi-AZ deployment

\- NAT Gateway for outbound internet access



\### 3. 🗄️ Database Layer



\- Amazon RDS PostgreSQL

\- Private Database Subnets

\- Database isolated from public internet

\- Multi-AZ architecture



\---



\## 🌍 Network Flow



```text

Internet

&#x20;  │

&#x20;  ▼

Internet Gateway

&#x20;  │

&#x20;  ▼

Application Load Balancer

&#x20;  │

&#x20;  ├───────────────┐

&#x20;  ▼               ▼

EC2 - AZ1       EC2 - AZ2

&#x20;  │               │

&#x20;  └───────┬───────┘

&#x20;          │

&#x20;          ▼

&#x20;    RDS PostgreSQL

