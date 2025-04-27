module "vsphere_vm" {
  source = "./modules/vsphere_vm"

  vm_name         = var.vm_name
  cpu             = var.cpu
  memory          = var.memory
  network_name    = var.network_name
  host_name       = var.host_name
  template_name   = var.template_name
  datacenter_name = var.datacenter_name
  datacenter_id      = data.vsphere_datacenter.datacenter.id
  host_datastore_map = var.host_datastore_map
}
