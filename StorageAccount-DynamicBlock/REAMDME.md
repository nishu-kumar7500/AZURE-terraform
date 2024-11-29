# Terraform Azure Storage Account Creation

This repository contains Terraform code to create an Azure Storage account.  It provides a repeatable and infrastructure-as-code (IaC) approach to managing your Azure storage resources.

## Usage

This repository is designed to be used with Terraform.  Before you begin, ensure you have the following:

* **Terraform installed:** Download and install Terraform from [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html).
* **Azure CLI installed and configured:** Install and configure the Azure CLI to authenticate with your Azure subscription.  Follow the instructions at [https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?pivots=all-clouds](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?pivots=all-clouds).
* **Azure provider configured:**  Ensure that your Azure provider is properly configured in your `~/.terraform.d/credentials.tf` file or using environment variables.  This typically involves setting the `AZURE_CLIENT_ID`, `AZURE_CLIENT_SECRET`, `AZURE_TENANT_ID`, and `AZURE_SUBSCRIPTION_ID` variables.  Refer to the Azure Terraform provider documentation for detailed instructions: [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)


**Steps to create a storage account:**

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   ```

2. **Navigate to the repository directory:**
   ```bash
   cd <repository_directory>
   ```

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Plan the changes:**
   ```bash
   terraform plan
   ```

5. **Apply the changes:**
   ```bash
   terraform apply
   ```

   This will create the Azure storage account defined in the Terraform configuration files.  Review the plan carefully before applying.

6. **Destroy the resources (when finished):**
   ```bash
   terraform destroy
   ```

   This will delete the storage account and its associated resources.  Use this command cautiously.


## Configuration

The specific configuration of the storage account (e.g., location, account name, type, etc.) is defined within the Terraform configuration files (e.g., `main.tf`, `variables.tf`).  You may need to modify these files to match your requirements.


## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.


## License

[Specify your license here, e.g., MIT License]
```
