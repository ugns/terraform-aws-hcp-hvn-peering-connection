data "aws_vpc" "default" {
  default = true
}

module "hcp_hvn" {
  source = "ugns/hcp-hvn/aws"
  # version = "x.x.x"

  hvn_region = var.hvn_region

  context = module.label.this
}

module "example" {
  source = "../.."
  # source = "ugns/hcp-hvn-peering-connection/aws"
  # version = "x.x.x"

  hcp_hvn_id  = module.hcp_hvn.hcp_hvn_id
  peer_vpc_id = data.aws_vpc.default.id

  context = module.label.this
}
