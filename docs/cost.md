# Cost and FinOps

## Main cost drivers
- Virtual machines (compute + OS disk)
- Public IP addresses
- Log Analytics ingestion and retention
- Azure Bastion (if enabled later)
- Storage accounts used for Terraform state and diagnostics

## Budget and alerts
- Each repo uses an RG-scoped budget with monthly amount (e.g. 6 USD/month for dev).
- Budget alerts at 30% usage send email to the owner.
- This prevents accidental overspend while still allowing experimentation.

## Cost-avoidance practices
- Use small B-series VMs and destroy them when not in use.
- Keep Bastion disabled in MVP; only enable when needed.
- Use a single shared Log Analytics workspace with basic retention.
- Regularly run `terraform destroy` for environments no longer in use.
- Preferred VM size is small burstable (B‑series). If B1s not available in policy‑allowed regions, fall back to next smallest SKU (e.g. B2ats v2) within free‑tier limits.

## Post-deploy sanity checks
- Check the resource group in the portal for unexpected resources.
- Compare Terraform state (`terraform state list`) with portal resources.
- Use Cost Analysis to validate there is no unusual spike after changes.

## Destroy process
- Run `terraform plan -destroy` and review the list of resources.
- Run `terraform destroy` and confirm.
- Validate in the portal that the RG is empty or deleted.
