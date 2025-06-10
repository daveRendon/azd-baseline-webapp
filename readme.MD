# Deploy a baseline web application

👉 https://blog.azinsider.net/9b6f1763f0de?source=friends_link&sk=341f047b25b57869b5be5c4609edbfaa

## Overview

This repository provides a baseline for deploying web applications. This architecture illustrates the essential elements of a simple web application. You can utilize this framework as a foundation to construct your web application, allowing for seamless customization to align with your specific requirements. 

![Solution Architecture Diagram](https://miro.medium.com/v2/resize:fit:1400/format:webp/0*uUt5U-lduXJqOGsc.png)

The architecture comprises an Azure App Service plan and leverages Azure SQL Database, and Azure Key Vault to securely store the database connection string, and employs Azure Monitor for comprehensive logging, monitoring, and proactive alerting.

You will get prompted during the AZD deployment step for the region to deploy this scenario.

This scenario can be deployed to Azure using the [Azure Developer CLI - AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/overview?WT.mc_id=AZ-MVP-5000671). 

💪 This template scenario is part of the larger **[Microsoft Trainer Demo Deploy Catalog](https://aka.ms/trainer-demo-deploy/?WT.mc_id=AZ-MVP-5000671)**.

## ⬇️ Installation
- [Azure Developer CLI - AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd?WT.mc_id=AZ-MVP-5000671)
    - When installing AZD, the above the following tools will be installed on your machine as well, if not already installed:
        - [GitHub CLI](https://cli.github.com?WT.mc_id=AZ-MVP-5000671)
        - [Bicep CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install?WT.mc_id=AZ-MVP-5000671)
    - You need Owner or Contributor access permissions to an Azure Subscription to  deploy the scenario.

## 🚀 Deploying the scenario in 3 easy steps:

1. From within a new folder on your machine, run `azd init` to initialize the deployment.
```
azd init -t daverendon/azd-baseline-webapp
```
2. Next, run `azd up` to trigger an actual deployment.
```
azd up
```
3. If you want to delete the scenario from your Azure subscription, use `azd down`
```
azd down --purge --force
```

⏩ Note: running `azd down` deletes the RG and Resources, but will keep the artifacts on your local machine.



