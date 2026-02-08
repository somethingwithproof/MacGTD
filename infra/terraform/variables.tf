variable "aws_region" {
  description = "AWS region for the Mac dedicated host"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Availability zone (must support mac2.metal)"
  type        = string
  default     = "us-east-1a"
}

variable "mac_instance_type" {
  description = "EC2 Mac instance type"
  type        = string
  default     = "mac2.metal"
}

variable "ssh_public_key" {
  description = "SSH public key for instance access"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed for SSH/VNC access"
  type        = list(string)
  default     = []
}

variable "github_runner_token" {
  description = "GitHub Actions runner registration token"
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "GitHub repository (owner/repo)"
  type        = string
  default     = "thomasvincent/MacGTD"
}

variable "alfred_powerpack_license" {
  description = "Alfred Powerpack license key"
  type        = string
  sensitive   = true
  default     = ""
}
