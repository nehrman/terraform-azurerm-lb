# Azure Virtual Machine Module

A Terraform module which creates Load Balancer on Azure with the following characteristics:
- Ability to decide if it is a **Public** or **Private** Load Balancer
- Configure Security Group for HTTP access
- Create an Availabity Set if a load balancer is configured (True by Default)
- Add VMs in the Backend Address Pool of the Load Balancer

## Terraform versions

Support of Terraform 0.12 is not yet implemented.

If you are using Terraform 0.11 you can use versions `v1.*`.

## Usage

Public Load Balancer Creation example: 

```hcl
data "terraform_remote_state" "rg" {
  backend = "remote"

  config = {
    organization = "<ORG_NAME>"

    workspaces = {
      name = "<WORKSPACE_NAME>"
    }
  }
}

module "lb" {
  source                      = "app.terraform.io/<ORG_NAME>/lb/azurerm"
  version                     = "1.0.0"
  tf_az_name                  = "demo"
  tf_az_env                   = "dev"
  tf_az_location              = "westeurope"
  tf_az_lb_type               = "public"
  tf_az_ft_name               = "lb-web-server"
  tf_az_lb_probes_port        = "80"
  tf_az_lb_probes_protocol    = "Tcp"
  tf_az_lb_probes_path        = "/"
  tf_az_lb_nb_probes          = "2"
  tf_az_lb_rule_proto         = "Tcp"
  tf_az_lb_rule_ft_port       = "80"
  tf_az_lb_rule_bck_port      = "80"
  tf_az_ft_priv_ip_addr       = "10.0.1.249"
  tf_az_ft_priv_ip_addr_alloc = "static"
  tf_az_subnet_id             = "${data.terraform_remote_state.rg.outputs.subnets_id[0]}"
  tf_az_rg_name               = "${data.terraform_remote_state.rg.outputs.resource_group_name}"

  tf_az_tags = {"env":"dev","owner":"me"}
}

```

## Authors

* **Nicolas Ehrman** - *Initial work* - [Hashicorp](https://www.hashicorp.com)



