output "hcp_hvn_target_link" {
  description = "A unique URL identifying the network peering."
  value       = hcp_aws_network_peering.this[0].self_link
}

output "aws_peer_destination_cidr" {
  description = "The destination CIDR of the VPC peer."
  value       = data.aws_vpc.peer.cidr_block
}
