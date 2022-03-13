variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "East US" #Cambiar por la región deseada <YOUR REGION>
}


variable "storage_account" {
  type = string
  description = "Nombre para la storage account"
  default = "gsotoaccount007"#Colocar el nombre para el Storage Account <STORAGE ACCOUNT NAME>
}

variable "public_key_path" {
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/id_rsa.pub" # Colocar la ruta donde se encuentra la clave SSH
}

variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "adminUsername"#Colocar el nombre de usuario SSH <SSH USER>
}