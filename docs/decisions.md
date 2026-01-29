# Decisions

## Isolation strategy (multiple repos in one subscription)
- One repo = one dedicated Resource Group (RG). All resources must be deployed into that RG.
- Use a unique name_prefix per repo to avoid naming collisions.
- Enforce tags on all resources: project, owner, env.

## MVP safety defaults
- Do not run terraform apply until variables are reviewed.
- Prefer minimal, low-cost SKUs; avoid Bastion/Log Analytics in MVP unless explicitly enabled.
