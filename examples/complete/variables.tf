variable "hvn_region" {
  type        = string
  description = "The AWS region where you want to deploy your HCP clusters."

  validation {
    condition = contains([
      "us-east-1",
      "us-west-2",
      "eu-west-1",
      "eu-west-2",
      "eu-central-1",
      "ap-southeast-1",
      "ap-southeast-2"
    ], var.hvn_region)
    error_message = "Sorry, hvn_region is not a valid supported HCP HVN region."
  }
}

variable "peer_vpc_id" {
  type        = string
  description = "The ID of the peer VPC in AWS."
}

variable "hcp_hvn_id" {
  type        = string
  description = "The ID of the HashiCorp Virtual Network (HVN)."
}
