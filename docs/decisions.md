# Decisions

## Isolation strategy (multiple repos in one subscription)
- One repo = one dedicated Resource Group (RG). All resources must be deployed into that RG.
- Use a unique name_prefix per repo to avoid naming collisions.
- Enforce tags on all resources: project, owner, env.
- Each repo owns its own resource group (e.g., minilz1-rg) so that all resources share the same lifecycle and can be destroyed together.
- Default region is France Central for this subscription because a policy blocks East Asia for VNets.

## Networking Strategy
- Use separate mgmt and app subnets to prepare for stricter NSG rules and potential private-only app access.

## MVP safety defaults
- Do not run terraform apply until variables are reviewed.
- Prefer minimal, low-cost SKUs; avoid Bastion/Log Analytics in MVP unless explicitly enabled.
