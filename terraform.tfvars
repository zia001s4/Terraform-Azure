
rg_name        = "Medefer001-RG"
location       = "Southeast Asia"
vnet_name      = "Dev-Vnet01"
address_space  = "16.16.0.0/16"
subnet_names   = ["Snet01", "Snet02", "Snet03"]
subnet_prefixes   = ["16.16.1.0/24","16.16.2.0/24","16.16.3.0/24"]
lb_pip_name    = "Dev-lb-pip"
web_vm_pip_name    = ["WEBVM-PiP01", "WEBVM-PiP02"]
db_vm_pip_name    = ["DBVM-PiP01", "DBVM-PiP02"]
nsg_name       = "Dev-nsg"
avset_name_web = "Avset-Web01"
avset_name_db  = "Avset-Web01"
web_vm_name    = ["deve-web-master", "deve-web-slave"]
db_vm_name     = ["deve-DB-master", "deve-DB-slave"]
web_vm_size        = "Standard_A1_v2"
db_vm_size        = "Standard_A1_v2"
user_name      = ["adm_zsid-web01","adm_zsid-web02"]
