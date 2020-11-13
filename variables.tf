
variable "rg_name" {
  type        = string
  #default     = "ZTest-RG"
  description = "My Resource Group Name"
}

variable "location" {
  type        = string
  #default     = "Southeast asia"
  description = "#default location for all the Resources"
}

variable "vnet_name" {
  type        = string
  #default     = "Z-Vnet"
  description = "Vnet Name for IAAS"
}

variable "address_space" {
  type        = string
  #default     = "15.0.0.0/16"
  description = "Vnet Address Space"
}

variable "subnet_names" {
  type = list(string)
  description = "Multiple subnet names"
}

variable "subnet_prefixes" {
  type = list(string)
  description = "SubNet Prefixes"
}

variable "lb_pip_name" {
  type        = string
  #default     = "Z-lb-pip"
  description = " Public IP Name"
}

variable "web_vm_pip_name" {
  type        = list
  #default     = ["Zvm-pip-01","Zvm-pip-02"]
  description = "Public IPs for the VMs"
}


variable "db_vm_pip_name" {
  type        = list
  #default     = ["Zvm-pip-01","Zvm-pip-02"]
  description = "Public IPs for the VMs"
}

variable "nsg_name" {
  type        = string
  #default     = "Znsg"
  description = "Dev NSG for Subnet"
}

variable "avset_name_web" {
  type        = string
  #default     = "Zweb-Avset-01"
  description = "Avset Name for Web Servers"
}

variable "avset_name_db" {
  type        = string
  #default     = "Zweb-Avset-01"
  description = "Avset Name for DB Servers"
}


variable "web_vm_name" {
  type        = list
  #default     = ["Zvm-web-01", "Zvm-web-02"]
  description = "VMs Name"
}


variable "db_vm_name" {
  type        = list
  #default     = ["Zvm-db-01", "Zvm-db-02"]
  description = "VMs Name"
}


variable "web_vm_size" {
  type        = string
  #default     = "Standard_A1_v2"
  description = "Its VM Size"
}


variable "db_vm_size" {
  type        = string
  #default     = "Standard_A1_v2"
  description = "Its VM Size"
}


variable "user_name" {
  #type        = list
  #default     = Adm_zsid
  description = "VM login User Name"
}
