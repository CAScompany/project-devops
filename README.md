# project-devops
Proyecto de CI/CD con Terraform, EKS y GitHub Actions

Este repositorio implementa un proceso de Integración Continua y Despliegue Continuo (CI/CD) utilizando Terraform para aprovisionar recursos en Amazon EKS (Elastic Kubernetes Service). El flujo de trabajo se automatiza mediante GitHub Actions, garantizando una entrega eficiente y fiable de la infraestrcutura y aplicaciones.

Para garantizar la integridad del código y un despliegue seguro, se implementa la estrategia de ramas en GitHub Actions. Esto impide los pushes directos a la rama main, asegurando que todos los cambios se realicen a través de pull requests que requieren revisión y aprobación antes de la fusión.

Pipeline de GitHub Actions - terraform.yml
Disparadores del Pipeline
El pipeline se activa en cada push a las ramas main y stage en la carpeta terraform/.

Variables de Entorno
Se utilizan variables de entorno seguras para gestionar las credenciales de AWS, el nombre del bucket de estado de Terraform, la región de AWS y el nombre del clúster EKS.

Trabajos del Pipeline
Terraform
El trabajo terraform se ejecuta en una máquina Ubuntu y realiza las siguientes tareas:

Configuración AWS: Establece las credenciales de AWS y kubectl.
Instalación kubectl: Descarga y configura kubectl.
Configuración Terraform: Instala y configura Terraform.
Terraform Init: Inicializa Terraform con el backend S3 para almacenar el estado.
Terraform Format: Verifica y formatea los archivos Terraform.
Terraform Validate: Valida la sintaxis y estructura de los archivos Terraform.
Terraform Plan: Genera un plan de ejecución de Terraform.
Terraform Apply: Aplica los cambios si el plan es exitoso.

Archivos Terraform
backend.tf
Configura el backend de Terraform para almacenar el estado en un bucket de S3. Este archivo garantiza una gestión segura y centralizada del estado de Terraform.

cluster.tf
Define un grupo de nodos para el clúster EKS con configuraciones específicas. Aquí se especifican los tipos de instancias y la capacidad del grupo de nodos.

efs.tf
Crea un sistema de archivos elástico (EFS) en AWS. Este archivo garantiza el almacenamiento persistente y compartido para las aplicaciones desplegadas.

s3bucket.tf
Crea un bucket de S3 para almacenar el estado de Terraform. Este archivo establece la infraestructura necesaria para la gestión centralizada del estado de Terraform.

variables.tf
Define variables utilizadas en los archivos Terraform. Esto facilita la personalización y reutilización de configuraciones.

vpc.tf
Configura la red virtual privada (VPC) para el clúster EKS. Este archivo establece la infraestructura de red necesaria para las aplicaciones en el clúster.

applydeployment.tf
Define recursos adicionales, como nodos EKS y recursos para aplicar en el clúster Kubernetes. Facilita la expansión y personalización de la infraestructura.

Carpeta Terraform
Contiene archivos Terraform que configuran la infraestructura en AWS.

Carpeta EKS
Contiene archivos YAML para desplegar aplicaciones en el clúster EKS.

Archivos YAML
deployment1.yml, deployment2.yml, deployment3.yml: Configuraciones de implementación para servicios en el clúster EKS. Especifican la cantidad de replicas y configuraciones de contenedores.

pvc.yml, pv.yml: Definiciones de reclamación y volumen persistentes para almacenamiento persistente en el clúster.

servicelb.yml: Configuración del servicio LoadBalancer para exponer los BE. Permite el acceso externo a los MS de BE desplegados.


deployment1.yml, deployment2.yml, deployment3.yml

Contienen las especificaciones de despliegue para servicios en el clúster EKS. Se definen detalles como:

Replicas: Establecen la cantidad de instancias del servicio que se ejecutarán para garantizar la disponibilidad y la escalabilidad.

Contenedores: Configuran las opciones de contenedor, como la imagen a utilizar, los puertos expuestos y los volúmenes asociados.

PVC: Define cómo y cuánto espacio de almacenamiento persistente necesita una aplicación, en este caso 10Gi.

PV: Especifica la implementación física de ese espacio de almacenamiento, detallando su capacidad y tipo.

servicelb.yml
Se encuentra la configuración del servicio LoadBalancer, el cual permitirá el acceso externo a los MS desplegados en el clúster EKS. 