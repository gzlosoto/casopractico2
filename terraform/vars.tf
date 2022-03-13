variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D2S_v3" # 8 GB, 2 CPU 
}

variable "vms"{
    type = list(string)
    description = "Lista de VMs a crear"
    default = ["master-nfs", "worker01"]
}