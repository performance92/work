variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "datacenter_name" {}

variable "host_datastore_map" {
  type = map(string)
  default = {
    "esxi1.cekino.local" = "SAS-SSD-R5-LDS1"
    "esxi2.cekino.local" = "SAS-SSD-R5-LDS2"
    "esxi3.cekino.local" = "SAS-SSD-R5-LDS3"
    "esxi4.cekino.local" = "ArGeData"
    "esxi5.cekino.local" = "SAS-8TB-1"
  }
}

variable "vm_name_prefix" {}
variable "vm_count" {}
variable "vm_name" {}
variable "cpu" {}
variable "memory" {}
variable "network_name" {}
variable "host_name" {}
variable "datacenter_id" {}
variable "template_name" {}
