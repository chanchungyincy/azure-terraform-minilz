# Decisions

## Isolation strategy (multiple repos in one subscription)
- One repo = one dedicated Resource Group (RG). All resources must be deployed into that RG.
- Use a unique name_prefix per repo to avoid naming collisions.
- Enforce tags on all resources: project, owner, env.
- Each repo owns its own resource group (e.g., minilz1-rg) so that all resources share the same lifecycle and can be destroyed together.
- Default region is France Central for this subscription because a policy blocks East Asia for VNets.

## Networking Strategy
- Use separate mgmt and app subnets to prepare for stricter NSG rules and potential private-only app access.
- Apply NSGs at subnet level so that all VMs in mgmt/app subnets share consistent rules. SSH is only open from an allowed CIDR into the mgmt subnet.

## Monitoring & Governance 
- Use a single shared Log Analytics workspace and Action Group in the hub to centralize logging and alerting for all spokes.
- Tried using ed25519 SSH keys for the Linux VM but the image/API only accepted RSA keys, so I standardised on 4096-bit RSA for compatibility.
- All resources use a common tag set: env, owner, costCenter, project. This enables cost breakdown and filtering in Cost Management.
- A built-in Azure Policy ("Require a tag on resources") is assigned to enforce the presence of the costCenter tag on new resources.

## MVP safety defaults
- Do not run terraform apply until variables are reviewed.
- Prefer minimal, low-cost SKUs; avoid Bastion/Log Analytics in MVP unless explicitly enabled.
- Preferred VM size is small burstable (B‑series). If B1s not available in policy‑allowed regions, fall back to next smallest SKU (e.g. B2ats v2) within free‑tier limits.

## CI/CD identity and RBAC

- GitHub Actions uses a dedicated Azure AD application (service principal or workload identity) to run Terraform.
- The CI/CD identity is granted the Contributor role only on the project resource group (minilz1-rg), not on the entire subscription.
- This follows least-privilege: the pipeline can deploy and destroy resources in its own RG but cannot modify unrelated resources.