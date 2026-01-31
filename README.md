# Azure Mini Landing Zone (Terraform)

Terraform deploys a minimal production-like Azure landing zone (simplified version) that includes networking, security baseline, cost guardrails, and reusable deployment/destruction.

## Goals (Interview-ready)
- A new user can deploy within 30 minutes and destroy within 10 minutes.
- No expensive resources are left behind after destroy.
- Clear runbook for troubleshooting common incidents.

## MVP Scope
- One dedicated Resource Group per repo (minilz1-rg for dev)
- Virtual Network with separate mgmt and app subnets
- NSG baseline: SSH only from allowed CIDR into mgmt subnet

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
