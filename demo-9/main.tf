module "vpc" {
  source                                 = "./modules/vpc"
  network_name                           = var.network_name
  auto_create_subnetworks                = var.auto_create_subnetworks
  routing_mode                           = var.routing_mode
  project_name                           = var.project_name
  network_description                    = var.network_description
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  mtu                                    = var.mtu
}
module "public-subnet" {
  source                          = "./modules/subnet"
  subnet_name                     = var.public_subnet_name
  subnet_description              = "public subnets are used for global ips"
  subnet_region                   = var.region
  network_name                    = module.vpc.network_name
  subnet_cidr_range               = var.public_subnet_cidr_range
  subnet_private_ip_google_access = false
}
module "private-subnet" {
  source                          = "./modules/subnet"
  subnet_name                     = var.private_subnet_name
  subnet_description              = "private subnets are used for internal ips"
  subnet_region                   = var.region
  network_name                    = module.vpc.network_name
  subnet_cidr_range               = var.private_subnet_cidr_range
  subnet_private_ip_google_access = true
}
module "ssh-global-firewall" {
  source                          = "./modules/firewalls"
  firewall_name                   = "${var.network_name}-allow-ssh"
  network_name                    = module.vpc.network_name
  direction                       = "INGRESS"
  priority                        = "1000"
  project_name                    = var.project_name
  source_ranges                   = var.ssh_source_ranges
  protocol                        = "tcp"
  ports                           = "22"
  target_tags                     = ["bastion"]
}
module "bastion" {
  source                = "./modules/instance"
  project_name          = var.project_name
  hostname              = "test-bastion"
  machine_type          = var.bastion_machine_type
  region_zone           = var.region_zone
  tags                  = var.bastion_tags
  network_name          = module.vpc.network_name
  subnet_name           = module.public-subnet.subnet_name
 }
