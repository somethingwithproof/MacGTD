# MacGTD E2E Runner Infrastructure

Project overview and status: [MacGTD](../../README.md).

Optional Terraform scaffolding for an EC2 Mac dedicated host. The default CI and native E2E pipeline uses GitHub-hosted macOS runners; deploying this infrastructure is not required. A self-hosted desktop needs a logged-in test account, interactive OS permissions, and manual Alfred Powerpack activation before licensed UI tests can run.

## Prerequisites

- AWS account with EC2 Mac instance access
- Terraform >= 1.5
- Alfred Powerpack license key
- GitHub personal access token (for runner registration)

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in values
2. Get a runner registration token:

   ```bash
   gh api repos/somethingwithproof/MacGTD/actions/runners/registration-token -f | jq -r .token
   ```

3. Deploy:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Deployment considerations

Review current AWS pricing and dedicated-host allocation/release terms before deployment. The bootstrap installs the runtime and runner tooling but does not silently modify desktop permissions or start a GUI runner as root. Start the runner from the dedicated logged-in account after granting permissions. Runner registration tokens expire; supply a fresh token at deployment time.

## Teardown

```bash
terraform destroy
```

Host release is subject to AWS allocation terms; verify eligibility before teardown.
