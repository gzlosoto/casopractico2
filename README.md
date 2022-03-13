# Solución Caso práctico #2
Descripción: Automatización de creación de infraestructura (Máquinas virtuales) con Terraform e instalación y configuración de Kubernetes con Ansible sobre la nube de Azure

Estructura del repositorio

```console

├── ansible
│   ├── deploy.sh
│   └── hosts
└── terraform
│    ├── correccion-vars.tf
│    ├── credentials.tf (completar, no subido al repositorio)
│    ├── main.tf
│    ├── network.tf
│    ├── security.tf
│    ├── vars.tf
│    ├── vm.tf
│    └── credentials.tf
├── LICENCE
├── README
```

## Terraform

Explicación de cada archivo

### correccion-vars.tf
En este archivo, de ayuda para la correción por los profesores se declaran 4 variables:
  - location: Se declara la región donde se va a implementar la infraestructura (Azure)

### credentials.tf
Archivo de ayuda para la corrección de profesores, no se sube porque contiene información de la suscripción de Azure con la que he trabajado el caso. Al ejecutar el terraform plan y terraform apply debe existir este archivo con esta estructura:

```console
provider "azurerm" {
  features {}
  subscription_id = "<SUBSCRIPCION ID>"
  client_id       = "<APP_ID>"
  client_secret   = "<PASSWORD>"
  tenant_id       = "<TENANT>"
}
```

### main.tf
Se declara el proveedor requerido por Terraform para trabajar sobre Azure. Además se declara la creación del Grupo de recursos y el Storage Account

### network.tf
Se deben crear una Red virtual y una subred virtual para que se conecten las máquinas a crear entre si. Asimismo aquí se declara el Network Interface, y la configuración de las ips públicas.

### security.tf
Se crear los grupos de seguridad para la creación de la máquina virtual

### vars.tf
Se declaran variables adicionales erlacioonadas al tamaño de máquina a crear y el listado de máquinas para dinamizar la cantidad de VMs a desplegar.

### vm.tf
Finalmente, aquí está declarada la creación de las máquinas virtuales
