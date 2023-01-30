  provider "azurerm" {
     subscription_id = "8cd9cb10-8a19-44a1-a5b7-3290ef2b3a24"
     client_id       = "f32b4b85-619b-41d4-b779-0a538fb455db"
     client_secret   = "ZbP8Q~_AinlyngV2anUj6IMjT6wuNMZvmdBd7cFZ"
     tenant_id       = "90b59039-d7b6-4056-bd4a-0c8614d852a8"
     features {
       
     }
}

resource "azurerm_resource_group" "example" {
  name     = "demorg-4"
  location = "east us"
}

resource "azurerm_service_plan" "example" {
  name                = "server"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "example" {
  name                = "appserviceinwindowsforservier"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}