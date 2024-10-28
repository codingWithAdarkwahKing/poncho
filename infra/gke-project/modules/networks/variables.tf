#### vpc.tf
variable "network_name" {
  description = "The name of the main network."
}

variable "network_routing_mode" {
  description = "The routing mode for the network."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to auto-create subnetworks."
  type        = bool
}

variable "mtu" {
  description = "The maximum transmission unit (MTU) for the network."
}

variable "delete_default_routes_on_create" {
  description = "Whether to delete default routes on creation."
  type        = bool    
}

variable "region_vpc" {
  description = "The region where the network will be created."
}

#### subnets.tf
variable "subnet_name" {
  description = "The name of the subnetwork."
}

variable "subnet_ip_cidr_range" {
  description = "The IP CIDR range for the subnetwork."
}

variable "private_ip_google_access" {
  description = "Whether to enable private IP access for resources in this subnetwork."
}

variable "secondary_ip_range_name" {
  description = "The name of the secondary IP range for the subnetwork."
}

variable "secondary_ip_range_cidr" {
  description = "The CIDR for the secondary IP range for the subnetwork."
}

variable "secondary_ip_service_range_name" {
  description = "The name of the secondary IP service range for the subnetwork."
}

variable "secondary_ip_service_range_cidr" {
  description = "The CIDR for the secondary IP service range for the subnetwork."
}

#### router.tf
variable "router_name" {
  description = "The name of the router."
}

#### nat.tf
variable "router_nat_name" {
  description = "The name of the NAT."
}

variable "nat_ip_ranges_source" {
  description = "The source IP ranges for NAT."

}

variable "nat_ip_allocate_option" {
  description = "The NAT IP allocation option."
  type        = string
  default     = "MANUAL_ONLY"
}

variable "subnetwork_source_ip" {
  description = "The source IP for the subnetwork."
}

variable "nat_address_name" {
  description = "The name of the NAT address."
}

variable "nat_address_type" {
  description = "The type of the NAT address."
}

variable "nat_address_network_tier" {
  description = "The network tier of the NAT address."
}

### firewalls.tf
variable "firewalls_name" {
  description = "The name of the firewall rule."
}

variable "firewalls_source_ranges" {
  description = "The source IP ranges for the firewall rule."
}
