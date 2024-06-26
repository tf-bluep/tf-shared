data "azurerm_client_config" "current" {
}
variable "application" {
  type = string
}

variable "owner" {
  type = string
}

variable "department" {
  type = string
}

variable "costcenter" {
  type = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "data_factory_name" {
  description = "Data Factory ID"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Location of Storage Account"
  type        = string
}



variable "managed_virtual_network_enabled" {
  description = "True to enable managed virtual network"
  type        = bool
  default     = true
}

variable "public_network_enabled" {
  description = "True to make data factory visible to the public network"
  type        = bool
  default     = false
}

variable "github_configuration" {
  description = "Github configuration for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#github_configuration"
  type        = map(string)
  default     = null
}

variable "global_parameters" {
  description = "Global parameters for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#global_parameter"
  type        = list(map(string))
  default     = []
}

variable "azure_devops_configuration" {
  description = "Azure DevOps configuration for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#vsts_configuration"
  type        = map(string)
  default     = null
}

variable "integration_runtime_type" {
  description = "Specifies the integration runtime type. Possible values are `Azure`, `AzureSSIS` and `SelfHosted`"
  type        = string
  default     = null

  validation {
    condition     = contains(["Azure", "SelfHosted", "AzureSSIS", null], var.integration_runtime_type)
    error_message = "Possible values for `integration_runtime_type` variable are \"Azure\", \"AzureSSIS\" and \"SelfHosted\"."
  }
}

variable "integration_runtime_description" {
  description = "Integration runtime description"
  type        = string
  default     = null
}

variable "integration_runtime_configuration" {
  description = <<EOF
  Parameters used to configure `AzureSSIS` integration runtime:
    `node_size` (optional, defaults to `Standard_D2_v3`)
    `number_of_nodes` (optional, defaults to `1`)
    `max_parallel_executions_per_nodes` (optional, defaults to `1`)
    `edition` (optional, defaults to `Standard`)
    `license_type` (optional, defaults to `LicenseIncluded`)
  Parameters used to configure `Azure` integration runtime
    `cleanup_enabled` (optional, defaults to `true`)
    `compute_type` (optional, defaults to `General`)
    `core_count` (optional, defaults to `8`)
    `time_to_live_min` (optional, defaults to `0`)
    `virtual_network_enabled` (optional, defaults to `false`)
  EOF
  type        = map(any)
  default     = {}
}

variable "integration_runtime_custom_name" {
  description = "Name of the integration_runtime resource"
  type        = string
  default     = null
}
