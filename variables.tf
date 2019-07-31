variable "tf_az_name" {
  description = "Name used to create all resources except subnets"
}

variable "tf_az_env" {
  description = "Environnement where the resources will be created"
}

variable "tf_az_rg_name" {
  description = "Name of Resource group to which data will be collected"
}

variable "tf_az_location" {
  description = "Define the location where to deploy LB."
}

variable "tf_az_lb_type" {
  type        = "string"
  description = "Define which type of Load Balancer will be provided"
  default     = "public"
}

variable "tf_az_pubip_address_alloc" {
  description = "Define which type of Public IP address Allocation will be used. Valid options are Static, Dynamic."
  default     = "Static"
}

variable "tf_az_ft_name" {
  description = "Define the name of Frontend IP Configuration"
}

variable "tf_az_lb_probes_protocol" {
  description = "Specifies the protocol of the end point."
  default = "Http"
}

variable "tf_az_lb_probes_port" {
  description = "Specifies the port on which the Probe queries the backend endpoint"
  default = "80"
}

variable "tf_az_lb_probes_path" {
  description = "Specifiers the URI used for requesting health status from the backend endpoint"
  default = "/"
}

variable "tf_az_lb_nb_probes" {
  description = "Specifies the number of failed probe attempts after which the backend endpoint is removed from rotation"
  default = "2"
}

variable "tf_az_lb_rule_proto" {
  description = "Specifies the transport protocol for the external endpoint."
  default = "Tcp"
}

variable "tf_az_lb_rule_ft_port" {
  description = "Specifies the port for the external endpoint"
  default = "80"
}

variable "tf_az_lb_rule_bck_port" {
  description = "Specifies the port used for internal connections on the endpoint"
}

variable "tf_az_tags" {
  description = "The tags to associate with your network and subnets."
  type        = "map"
}

variable "tf_az_subnet_id" {
  description = "Define Subnet that will be used for NIC configuration"
  default     = ""
}

variable "tf_az_ft_priv_ip_addr" {
  description = "Define the Private IP Address that will be used for the Front End "
  default     = ""
}

variable "tf_az_ft_priv_ip_addr_alloc" {
  description = "Speicifies how the private Ip address will be allocated"
  default     = "Static"
}
