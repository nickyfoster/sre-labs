# Linux Troubleshooting Labs

Welcome to the Linux Troubleshooting Labs - a hands-on learning environment designed for SREs and sysadmins. Deployed on AWS using Terraform and configured with Ansible, these labs offer practical scenarios to enhance your troubleshooting skills in a Linux server environment.



## Overview of Labs
In these labs, you'll encounter real-world challenges that Linux administrators face. From web server errors to system performance issues, each lab is crafted to test and improve your problem-solving skills.

### Terrafom configuration
Create `terraform/terraform.tfvars` file with the following content:
```
vpc_id          = "<AWS VPC ID>"
subnet_id       = "<AWS subnet ID>"
vpn_server_cidr = "<VPN server CIDR for security group>"
tags = {
  Terraform = true
}
```

### Lab 1: Web Server Troubleshooting
**Challenge**: The webserver initially responds well but suddenly starts returning 500 errors. Can you diagnose and resolve the issue?
- **Lab Documentation**: [Lab 1 Description](docs/lab01/lab01-description.md)

## Scenarios for In-depth Learning
### Scenario 1: Network Configuration
**Documentation**: [Network Configuration Scenario](docs/scenarios/scenario01-network-configuration.md)

### Scenario 2: File System and Storage
**Documentation**: [FS and Storage Scenario](docs/scenarios/scenario02-fs-and-storage.md)

### Scenario 3: CPU and Memory Optimization
**Documentation**: [CPU and Memory Scenario](docs/scenarios/scenario03-CPU-and-memory.md)

### Scenario 4: I/O Performance
**Documentation**: [IO Performance Scenario](docs/scenarios/scenario04-io-performance.md)

### Scenario 5: Service Misconfiguration
**Documentation**: [Service Misconfiguration Scenario](docs/scenarios/scenario05-service-misconfig.md)

