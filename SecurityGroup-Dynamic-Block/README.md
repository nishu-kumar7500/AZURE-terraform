# Azure Network Security Group with Ingress & Egress Rules

This Terraform configuration deploys an **Azure Network Security Group (NSG)** with configurable **ingress** and **egress** rules.

## Prerequisites

Ensure you have the following prerequisites before using this Terraform configuration:

1. **Terraform**: Installed and configured (minimum version 1.0.0 recommended).
2. **Azure CLI**: Installed and logged in to your Azure account.
3. **Azure Subscription**: You need an active Azure subscription.

## Features

- Creates a **Network Security Group (NSG)**.
- Allows you to dynamically define ingress (inbound) and egress (outbound) rules.
- Leverages Terraform's `for_each` and `dynamic` block for flexibility.

## File Structure

- `main.tf`: Contains the Terraform configuration for the Azure NSG and its rules.
- `variables.tf`: Defines input variables for the project.
- `outputs.tf`: (Optional) Outputs resources like the NSG ID and name.

## Variables

The following input variables are supported:

### **Ingress Rules (`ingress_rules`)**
| Variable Name              | Type   | Description                             | Example Value       |
|----------------------------|--------|-----------------------------------------|---------------------|
| `name`                     | String | Name of the rule                        | `"AllowSSH"`        |
| `priority`                 | Number | Priority for the rule (100-4096)        | `100`               |
| `direction`                | String | Direction of traffic (`Inbound`)        | `"Inbound"`         |
| `access`                   | String | Access type (`Allow` or `Deny`)         | `"Allow"`           |
| `protocol`                 | String | Protocol to allow/deny (`Tcp`, `Udp`)   | `"Tcp"`             |
| `source_port_range`        | String | Source port range (`*` for all)         | `"*"`               |
| `destination_port_range`   | String | Destination port range (`*` for all)    | `"22"`              |
| `source_address_prefix`    | String | Source address prefix                   | `"*"`               |
| `destination_address_prefix` | String | Destination address prefix              | `"*"`               |

### **Egress Rules (`egress_rules`)**
| Variable Name              | Type   | Description                             | Example Value       |
|----------------------------|--------|-----------------------------------------|---------------------|
| `name`                     | String | Name of the rule                        | `"AllowInternet"`   |
| `priority`                 | Number | Priority for the rule (100-4096)        | `100`               |
| `direction`                | String | Direction of traffic (`Outbound`)       |
