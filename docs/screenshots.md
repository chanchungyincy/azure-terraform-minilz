# Screenshots Evidence Pack

## Day 1 - Repo bootstrap
### Repo structure 
![Repo structure](./screenshots/2.png)

### Tooling versions 
![Terraform + Azure CLI versions](./screenshots/1.png)

## Day 2 - Resource Group

### Terraform apply 
![RG apply](./screenshots/3.png)

### Resource group in portal 
![RG portal](./screenshots/4.png)

## Day 3 - Network

### Terraform apply in francecentral (because of policy)
![VNet apply](./screenshots/5.png)

### Virtual network 
![VNet](./screenshots/6.png)

### Mgmt/app subnets 
![Subnets](./screenshots/7.png)

## Day 4 - NSG baseline

### Mgmt NSG with SSH rule 
![SSH rule](./screenshots/8.png)

### Subnet NSG associations 
![NSG association](./screenshots/9.png)

### Troubleshooting -- disallowed region
![region](./screenshots/11.png)
I used eastaisa at first and no trouble in the before date. However, when deploying vnet, exist error: RequestDisallowedByAzure.
After reading the error message, I find that eastasia is not the available region for "azure for student". So, I find the policy in Azure Portal and only a few region is available for me. I decided to change the location to "franchcentral". Because of parameterization of the region attribute, I just need to change a variable in .tfvars and fixed easily.

## Day 5 - Cost guardrails

### RG budget
![RG budget list](./screenshots/12.png)

### Budget details 
![RG budget details](./screenshots/13.png)

## Day 6 - Hub and Spoke networking

### Hub and spoke VNets 
![Hub and Spoke VNets](./screenshots/14.png)

## Day 7 - Logging and monitoring

### Log Analytics workspace 
![Log Analytics](./screenshots/15.png)

### Action Group
![Action Group](./screenshots/16.png)

## Day 8 - Linux VM

### Terraform apply 
![VM apply](./screenshots/17.png)

### VM networking 
![VM networking](./screenshots/18.png)

### SSH into VM 
![SSH](./screenshots/19.png)

## Day 9 - Tagging and policy

### Tagged resources 
![Tags](./screenshots/20.png)

### Tag policy assignment 
![Tag policy](./screenshots/21.png)

## Day 10 - CI/CD identity and RBAC

### App registration for GitHub Actions 
![App registration](./screenshots/22.png)

### RG role assignment 
![RG RBAC](./screenshots/23.png)

## Day 11 - Remote state backend

### Storage account container with tfstate (proves: remote backend configured)
![Remote state](./screenshots/24.png)