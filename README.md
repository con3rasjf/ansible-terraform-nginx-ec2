# DevOps Tutorial: Deploying and Managing a Web App with Terraform and Ansible on AWS

Este proyecto muestra un flujo completo de Infraestructura como Código (IaC) y Automatización DevOps utilizando:

- **Terraform** para crear la infraestructura en AWS.
- **Ansible** para configurar un servidor web Nginx, desplegar versiones de una app web y gestionar su mantenimiento.

---

## ✨ Tecnologías usadas
- Terraform
- Ansible
- AWS (EC2, VPC, Key Pair, Security Groups)
- Ubuntu Server 24.04 (AMI: `ami-084568db4383264d4`)

---

## 🌐 Estructura del proyecto

```
project-root/
├── terraform/                  # Infraestructura en AWS
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── ansible/                    # Configuración y despliegue
│   ├── inventory.ini
│   ├── playbook-install-nginx.yml
│   ├── playbook-deploy-v2.yml
│   ├── playbook-upgrade-nginx.yml
│   └── files/
│       ├── app/                # Versión inicial
│       │   ├── v1/
│       │   ├──── index.html
│       │   ├──── style.css
│       │   └── v2/             # Nueva versión con mejoras
│       │   ├──── index.html
│       │   ├──── style.css
---
```

## 🌟 Paso 1: Aplicación web sencilla

Se crea una app HTML/CSS que presenta al autor como DevOps Engineer. Esta app se desplegará en Nginx. Puedes personalizar `index.html` con tu nombre, perfil, y redes.

---

## 🚀 Paso 2: Crear infraestructura en AWS con Terraform

Terraform crea:
- Una VPC, subred pública, y gateway de internet
- Un grupo de seguridad con puertos 22 y 80 abiertos
- Una instancia EC2 (Ubuntu 22.04) con una clave SSH generada localmente

Configurar credenciales de AWS:
- Crea un Usuario IAM en tu cuenta con AK/SK
- Configura las credenciales del usuario con un perfil:

```bash
aws configure --profile felipe
```

Crear par de llaves SSH:
```bash
ssh-keygen -t rsa -b 4096 -f /project-root/terraform/.ssh/devops_key -C "devops-tutorial"
```


Ejecutar:
```bash
cd terraform/
terraform init
terraform validate
terraform fmt
terraform plan 
terraform apply -auto-approve
```

**Resultado:** Una instancia EC2 corriendo Ubuntu, lista para configurarse con Ansible.

---

## 🤖 Paso 3: Instalar Nginx y desplegar versión inicial

Se usa Ansible para instalar Nginx y copiar los archivos HTML y CSS:
```bash
cd ansible/
ansible-playbook -i inventory.ini playbook-install-nginx.yml
```

La web estará disponible en `http://<EC2_PUBLIC_IP>`.

---

## 🚗 Paso 4: Desplegar nueva versión de la app web

Se despliega una versión 2 con mejoras en HTML y estilos:
```bash
ansible-playbook -i inventory.ini playbook-deploy-v2.yml
```

Esto reemplaza los archivos en `/var/www/html/` y no reinicia Nginx.

---

## 🧹 Paso 5: Verificar y actualizar versión de Nginx

Este playbook compara la versión instalada vs la disponible en `apt`, y si es necesario la actualiza y reinicia Nginx:
```bash
ansible-playbook -i inventory.ini playbook-upgrade-nginx.yml
```

Incluye comentarios detallados para entender cada módulo y condición usada.

---

## 📊 Resultado Final

- Infraestructura creada con Terraform
- Configuración de servidor y despliegue con Ansible
- App web versionada desplegada en EC2
- Automatización de mantenimiento con actualización condicional de Nginx

---

## 🆑​ Eliminar infraestructura

Ejecutar:
```bash
terraform destroy -auto-approve
```
---

## 🌟 Autor

**Juan Felipe Contreras Correa**  
DevOps Engineer | Automatización, CI/CD, Cloud & Infraestructura como Código

[LinkedIn](https://www.linkedin.com/in/tuusuario)

---

✨ Comparte este repositorio si te fue útil o si quieres mostrar cómo trabajas DevOps end-to-end 🚀

