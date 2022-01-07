output "hcp_hvn_target_link" {
  description = "A unique URL identifying the HVN route."
  value       = hcp_aws_network_peering.this[0].self_link
}