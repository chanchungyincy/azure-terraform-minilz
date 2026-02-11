## Where to look when incidents happen

- Logs: Go to the shared Log Analytics workspace (minilz1-hub-law) in the hub RG and query activity/metrics for affected resources.
- Alerts: Action Group <minilz1-hub-ag-email> sends email notifications when alert rules (to be added) are triggered.

## Troubleshooting: cannot SSH into VM

1. Check VM state:
   - In the Azure portal, confirm the VM is running and has a public IP.
2. Check NSG:
   - Go to the subnet NSG (spoke mgmt NSG) and verify there is an inbound rule allowing TCP/22 from your allowed_ssh_cidr.
   - Ensure there is no higher-priority rule blocking port 22.
3. Check your client IP:
   - Confirm your public IP has not changed; update allowed_ssh_cidr if needed.
4. Check SSH command:
   - Use the correct username and private key: `ssh -i <path-to-private-key> <admin_username>@<public_ip>`.