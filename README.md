# AWS 3-Tier Production Architecture

<p align="center">
  <img src="https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws&logoColor=white" />
  <img src="https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" />
  <img src="https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/Flask-Web%20Application-000000?style=for-the-badge&logo=flask&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-Database-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Redis-Cache-DC382D?style=for-the-badge&logo=redis&logoColor=white" />
</p>

<p align="center">
  <b>Production-style AWS 3-Tier Architecture using Terraform, Docker, PostgreSQL, Redis and AWS networking best practices.</b>
</p>

---

## Project Overview

This project demonstrates the design and implementation of a production-style **AWS 3-Tier Architecture** using Infrastructure as Code and containerization technologies.

The architecture separates the infrastructure into three logical layers:

- Public / Load Balancing Tier
- Private Application Tier
- Private Database Tier

The infrastructure is designed with **Multi-AZ networking, security groups, NAT Gateways, Application Load Balancer, EC2, RDS PostgreSQL and Redis caching**.

The application layer contains a lightweight Flask application packaged as a Docker container.

The infrastructure is defined using Terraform modules to make the architecture reusable, maintainable and scalable.

---

## Project Goal

The primary goal of this project is to demonstrate how a production-style cloud application can be designed using AWS networking and DevOps best practices.

Key objectives:

- Design a secure AWS VPC
- Implement public and private subnet architecture
- Deploy resources across multiple Availability Zones
- Configure an Application Load Balancer
- Deploy application servers in private subnets
- Implement PostgreSQL database infrastructure
- Implement Redis caching
- Use Security Groups for tier-to-tier communication
- Provision infrastructure using Terraform
- Containerize the Flask application using Docker
- Implement application health checks
- Create a monitoring-ready architecture
- Maintain clean Infrastructure as Code practices

---

# Architecture

```text
                              INTERNET
                                  |
                                  v
                         +----------------+
                         | Internet Gateway|
                         +--------+-------+
                                  |
                    +-------------+-------------+
                    |                           |
                    v                           v
             PUBLIC SUBNET AZ-A          PUBLIC SUBNET AZ-B
                    |                           |
                    +-------------+-------------+
                                  |
                                  v
                       +----------------------+
                       | Application Load     |
                       | Balancer (ALB)       |
                       +----------+-----------+
                                  |
                    +-------------+-------------+
                    |                           |
                    v                           v
             PRIVATE APP AZ-A            PRIVATE APP AZ-B
                    |                           |
             +------+-------+             +-----+------+
             | EC2 / Flask |             | EC2 / Flask|
             | Application  |             | Application |
             +------+-------+             +-----+------+
                    |                           |
                    +-------------+-------------+
                                  |
                                  v
                         PRIVATE DB SUBNETS
                                  |
                    +-------------+-------------+
                    |                           |
                    v                           v
              PostgreSQL RDS              Redis Cache
                Multi-AZ                    Layer
                    |
                    v
              Application Data