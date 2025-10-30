## Reto — Provisionamiento Web + PostgreSQL con Vagrant 

Este proyecto utiliza Vagrant para provisionar dos máquinas virtuales:
- **web:** Servidor Apache + PHP 7.4 + php-pgsql
- **db:** Servidor PostgreSQL 12 con base de datos `empresa`

### Pasos de instalación

1️. Clonar el proyecto
git clone https://github.com/valedeveloper/vagrant-web-provisioning.git
cd vagrant-web-provisioning

2️. Asignar IPs privadas en `Vagrantfile`:
- web → `192.168.56.10`
- db → `192.168.56.11`

3️. Levantar e instalar servicios con provisionamiento automático:
vagrant up --provision

4️. Provisionar DB:
vagrant provision db


5️. Verificar acceso a la web:
- Web page: http://192.168.56.10/
- PHP info: http://192.168.56.10/info.php
- Empleados: http://192.168.56.10/empleados.php

---

### Scripts utilizados

| Script | Función |
|--------|---------|
| `provision-web.sh` | Instala Apache + PHP, configura `/var/www/html` |
| `provision-db.sh` | Instala PostgreSQL, crea BD, tabla y usuarios |

---

### Capturas de pantalla

Incluir en la entrega:
- Página web funcionando (`index.html`)
- phpinfo() mostrando PHP con extensión pgsql
- Tabla de empleados desde la BD en `empleados.php`

---

### Credenciales y DB

| Recurso | Valor |
|--------|------|
| Base de datos | `empresa` |
| Tabla | `empleados` |
| Usuario | `webuser` |
| Clave | `webpass123` |
| IP Web | `192.168.56.10` |
| IP DB | `192.168.56.11` |

---

### Autor
Valeria Jiménez Bedoya 2246548

