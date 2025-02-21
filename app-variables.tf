####################################
## Application Module - Variables ##
####################################

# Application definition

variable "app_name" {
  type        = string
  description = "Application name"
}

variable "app_environment" {
  type        = string
  description = "Application environment"
}

variable "f5_se" {
  type        = string
  description = "F5 Engineer"
}

variable "time_zone" {
  type        = string
  description = "Time Zone"
}
