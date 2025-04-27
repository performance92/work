data "vsphere_virtual_machine" "template" {
  name          = var.template_name
  datacenter_id = var.datacenter_id
}

data "vsphere_host" "host" {
  name          = var.host_name
  datacenter_id = var.datacenter_id
}

data "vsphere_datastore" "datastore" {
  name          = lookup(var.host_datastore_map, var.host_name)
  datacenter_id = var.datacenter_id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = var.datacenter_id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  host_system_id   = data.vsphere_host.host.id
  datastore_id     = data.vsphere_datastore.datastore.id

  firmware = "efi"
  num_cpus = var.cpu
  memory   = var.memory
  guest_id = "ubuntu64Guest"
  
    network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 100
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
}
