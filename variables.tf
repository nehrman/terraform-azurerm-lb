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
  default     = "static"
}

variable "tf_az_ft_name" {
  description = "Define the name of Frontend IP Configuration"
}

variable "tf_az_lb_probes_port" {
  description = ""
}

variable "tf_az_lb_nb_probes" {
  description = ""
}

variable "tf_az_lb_rule_proto" {
  description = ""
}

variable "tf_az_lb_rule_ft_port" {
  description = ""
}

variable "tf_az_lb_rule_bck_port" {
  description = ""
}

variable "tf_az_tags" {
  description = "The tags to associate with your network and subnets."
  type        = "map"
}
