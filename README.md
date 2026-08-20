# AWS 3-Tier Production Architecture

A production-style AWS 3-Tier Architecture designed using Terraform and AWS networking best practices.

## ??? Architecture

```text
                    Internet
                       |
                       v
              Internet Gateway
                       |
              +--------+--------+
              |                 |
         Public AZ-1       Public AZ-2
              |                 |
              +--------+--------+
                       |
                 Application
              Load Balancer
                       |
              +--------+--------+
              |                 |
         Private App-1    Private App-2
              |                 |
              +--------+--------+
                       |
                 Private DB Tier
              +--------+--------+
              |                 |
            RDS AZ-1         RDS AZ-2
