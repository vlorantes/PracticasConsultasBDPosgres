readme_text = """# Prácticas de Consultas en PostgreSQL - Railway

Este repositorio contiene el script de base de datos y las consultas SQL desarrolladas para el sistema de gestión de la base de datos **railway**, enfocada en la organización de destinos turísticos y categorías para el proyecto de El Salvador.

## 🚀 Tecnologías Utilizadas
* **PostgreSQL:** Sistema de gestión de bases de datos relacional.
* **pgAdmin 4:** Herramienta de administración y desarrollo para PostgreSQL.
* **SQL:** Lenguaje de consulta estructurado (DDL y DML).
* **Git/GitHub:** Control de versiones para el seguimiento del proyecto.

## 📂 Estructura de la Base de Datos
La base de datos incluye las siguientes entidades principales:
1. **Categorías:** Clasificación de los destinos (Playas, Montañas, Pueblos, etc.).
2. **Destinos:** Información detallada sobre lugares turísticos de El Salvador (nombre, descripción, departamento, precio e ID de categoría).
3. **Usuarios_Contacto:** Registro de datos capturados desde el formulario de la landing page.

## 📝 Instrucciones de Instalación y Uso
1. **Crear la Base de Datos:**
   ```sql
   CREATE DATABASE railway;