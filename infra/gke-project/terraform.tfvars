region="europe-west8-a"
clusterName="cluster-1"
diskSize=40
minNode=1
maxNode=3
machineType="e2-standard-4"

#### vpc.tf
network_name = "main"
network_routing_mode = "REGIONAL"
auto_create_subnetworks = false
mtu = 1460
delete_default_routes_on_create = false
region_vpc = "europe-west8"
subnet_name = "private"
subnet_ip_cidr_range = "10.0.0.0/18"
private_ip_google_access = true
secondary_ip_range_name = "k8s-pod-range"
secondary_ip_range_cidr = "10.0.64.0/18"
secondary_ip_service_range_name = "k8s-service-range"
secondary_ip_service_range_cidr = "10.0.128.0/22"
router_name = "router"
router_nat_name = "nat1"
nat_ip_ranges_source = "LIST_OF_SUBNETWORKS"
nat_ip_allocate_option = "MANUAL_ONLY"
subnetwork_source_ip = ["ALL_IP_RANGES"]
nat_address_name = "nat1"
nat_address_type = "EXTERNAL"
nat_address_network_tier = "PREMIUM"
firewalls_name = "allow-ssh"
firewalls_source_ranges = ["0.0.0.0/0"]

project_id = "k8s-project-412321(dummy)"

### helm_release
argo_namespace = "argocd"
sealed_secrets_namespace = "kube-system"