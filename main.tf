# Create Public IP Address for the Load Balancer
resource "azurerm_public_ip" "lb" {
  count                        = "${var.tf_az_lb_type == "public" ? 1 : 0}"
  name                         = "${var.tf_az_env}-${var.tf_az_name}-pubip"
  resource_group_name          = "${var.tf_az_rg_name}"
  location                     = "${var.tf_az_location}"
  public_ip_address_allocation = "${var.tf_az_pubip_address_alloc}"
  tags                         = "${var.tf_az_tags}"
}

# create and configure Azure Load Balancer 

resource "azurerm_lb" "lb" {
  name                = "${var.tf_az_env}-${var.tf_az_name}-lb"
  resource_group_name = "${var.tf_az_rg_name}"
  location            = "${var.tf_az_location}"
  tags                = "${var.tf_az_tags}"

  frontend_ip_configuration {
    name                 = "${var.tf_az_ft_name}"
    public_ip_address_id = "${azurerm_public_ip.lb.id}"
  }
}

resource "azurerm_lb_probe" "lb" {
  name                = "${var.tf_az_name}-${var.tf_az_lb_probes_port}-probe"
  resource_group_name = "${var.tf_az_rg_name}"
  loadbalancer_id     = "${azurerm_lb.lb.id}"
  port                = "${var.tf_az_lb_probes_port}"
  number_of_probes    = "${var.tf_az_lb_nb_probes}"
}

resource "azurerm_lb_rule" "lb" {
  name                           = "${var.tf_az_name}-rule"
  resource_group_name            = "${var.tf_az_rg_name}"
  loadbalancer_id                = "${azurerm_lb.lb.id}"
  protocol                       = "${var.tf_az_lb_rule_proto}"
  frontend_port                  = "${var.tf_az_lb_rule_ft_port}"
  backend_port                   = "${var.tf_az_lb_rule_bck_port}"
  frontend_ip_configuration_name = "${var.tf_az_ft_name}"
  probe_id                       = "${azurerm_lb_probe.lb.id}"
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.lb.id}"
  depends_on                     = ["azurerm_lb_probe.lb","azurerm_lb_backend_address_pool.lb"]
}

resource "azurerm_lb_backend_address_pool" "lb" {
  name                = "${var.tf_az_env}-${var.tf_az_name}-bck-pool"
  resource_group_name = "${var.tf_az_rg_name}"
  loadbalancer_id     = "${azurerm_lb.lb.id}"
}
