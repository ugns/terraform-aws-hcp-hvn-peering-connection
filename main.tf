
data "aws_vpc" "peer" {
  id = var.peer_vpc_id
}

data "aws_arn" "peer" {
  arn = data.aws_vpc.peer.arn
}

module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["pcx"]
  context    = module.this.context
}

resource "hcp_aws_network_peering" "this" {
  count = local.enabled ? 1 : 0

  hvn_id          = var.hcp_hvn_id
  peering_id      = module.label.id
  peer_vpc_id     = data.aws_vpc.peer.id
  peer_account_id = data.aws_vpc.peer.owner_id
  peer_vpc_region = data.aws_arn.peer.region

  timeouts {
    create = var.create_timeout
    delete = var.delete_timeout
  }

}

resource "aws_vpc_peering_connection_accepter" "this" {
  count = local.enabled ? 1 : 0

  vpc_peering_connection_id = hcp_aws_network_peering.this[0].provider_peering_id
  auto_accept               = true
  tags                      = module.label.tags
}

locals {
  enabled = module.this.enabled
}
