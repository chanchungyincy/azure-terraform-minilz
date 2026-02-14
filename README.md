# Azure Mini Landing Zone (Terraform)

Terraform deploys a minimal production-like Azure landing zone (simplified version) that includes networking, security baseline, cost guardrails, and reusable deployment/destruction.

## Goals (Interview-ready)
- A new user can deploy within 30 minutes and destroy within 10 minutes.
- No expensive resources are left behind after destroy.
- Clear runbook for troubleshooting common incidents.
- RG-scoped monthly budget with email alert at 80% usage to avoid overspend.

## MVP Scope
- One dedicated Resource Group per repo (minilz1-rg for dev)
- Virtual Network with separate mgmt and app subnets
- NSG baseline: SSH only from allowed CIDR into mgmt subnet
- Hub-spoke style networking: separate hub and spoke VNets ready for peering.
- One Linux VM in the spoke mgmt subnet with SSH access locked down by NSG.

## State management

- Local state was used for early development only.
- The dev environment now uses an Azure Storage backend for Terraform state:
  - Storage account + blob container store `dev.tfstate`.
  - This enables team collaboration and protects the state from accidental local deletion.
- To work with this repo:
  - Log in with `az login`.
  - Run `terraform init` so Terraform can connect to the remote backend.

## Isolation (Multiple repos / one subscription)
- One repo uses one dedicated Resource Group.
- Use unique name_prefix per repo.
- Tags are mandatory: project/owner/env.

## Prerequisites
- Azure subscription 
- Azure CLI, Terraform
- Logged in: `az login`

## Safety
- This repo can create billable Azure resources (VM, public IP, disks).
- Always run `terraform plan` before `terraform apply`.

## Quick start
- After apply, use the VM public IP and your SSH key to connect: `ssh azureuser@<public_ip>`.