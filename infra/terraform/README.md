# MacGTD E2E Runner Infrastructure

Terraform configuration for provisioning an EC2 Mac dedicated host as a GitHub Actions self-hosted runner.

## Prerequisites

- AWS account with EC2 Mac instance access
- Terraform >= 1.5
- Alfred Powerpack license key
- GitHub personal access token (for runner registration)

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in values
2. Get a runner registration token:
   ```bash
   gh api repos/thomasvincent/MacGTD/actions/runners/registration-token -f | jq -r .token
   ```
3. Deploy:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Cost

EC2 Mac dedicated hosts have a **24-hour minimum allocation**.

| Instance | Chip | Approx. Cost |
|----------|------|-------------|
| mac2.metal | M1 | ~$15.60/day |
| mac2-m2pro.metal | M2 Pro | ~$18.48/day |

## Teardown

```bash
terraform destroy
```

**Note:** The dedicated host must have been allocated for at least 24 hours before it can be released.
