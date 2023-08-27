resource "random_pet" "this" {
  length = 2 # using 2, since default separator is '-', also account name can only be 24 characters, and lowercase letters
  separator = ""# a blank string separator because azure storage accounts dont support - characters
}

data "azurerm_resource_group" "this" {
  name = <%= output("demo.rg_name")%>
}

module "storage_account" {
  source                    = "../../modules/example"
  name                      =  "sa${random_pet.this.id}"
  resource_group_name       = data.azurerm_resource_group.this.name
  location                  = data.azurerm_resource_group.this.location
  enable_https_traffic_only = var.enable_https_traffic_only
}
