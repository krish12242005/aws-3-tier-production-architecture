# AWS 3-Tier Production Architecture

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure-purple)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue)
![Python](https://img.shields.io/badge/Python-3.12-blue)
![Flask](https://img.shields.io/badge/Flask-Web%20Application-black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue)
![Redis](https://img.shields.io/badge/Redis-Cache-red)

> A production-style AWS 3-Tier Architecture designed using Terraform, Docker, PostgreSQL, Redis, and AWS networking best practices.

---

## Overview

This project demonstrates a production-style 3-Tier application architecture designed for AWS.

The architecture follows common cloud best practices including:

- Multi-AZ architecture
- Public and private subnets
- Application Load Balancer
- Private application tier
- Private database tier
- PostgreSQL database
- Redis caching
- Dockerized Flask application
- Infrastructure as Code using Terraform
- Application health checks
- Monitoring-ready architecture

The application has been successfully validated locally using Docker Desktop.

---

## Architecture

```text
                         INTERNET
                            |
                            v
                    +---------------+
                    | Internet GW   |
                    +-------+-------+
                            |
                +-----------+-----------+
                |                       |
         Public Subnet AZ-A      Public Subnet AZ-B
                |                       |
                +-----------+-----------+
                            |
                            v
                  +-------------------+
                  | Application ALB   |
                  +---------+---------+
                            |
                +-----------+-----------+
                |                       |
         Private App AZ-A        Private App AZ-B
                |                       |
             EC2 / App              EC2 / App
                |                       |
                +-----------+-----------+
                            |
                     Private DB Tier
                            |
                  +---------v---------+
                  | PostgreSQL RDS    |
                  |     Multi-AZ      |
                  +-------------------+

                     Redis Cache Layer
                            |
                         Redis