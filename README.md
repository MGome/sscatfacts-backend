# SSCatFacts Backend
### by Mario Gómez - { bigMario } :ghost:
---
## Setup inicial :rocket:
1) Una vez clonado el repositorio, se deben instalar las dependencias del proyecto a través del comando:
```
bundle install
```
2) Luego se debe crear un archivo ```.env``` en la carpeta raíz, el cual debe contener las siguientes credenciales:
```
POSTGRESQL_USERNAME='your_username'
POSTGRESQL_PASSWORD='your_password'
```
3) Finalmente, ejecuta los comandos para la creación y migración de la base de datos:
```
rails db:create
rails db:migrate
```
4) Listo! Ya puedes comunicarte con SSCatFacts Backend.

---
## Decisiones de diseño
1) La creación de usuarios se realiza validando la presencia del username y que este sea único. Esta última validación no es *case sensitive*, por lo que podrán existir usuarios con el mismo username y con diferencias en las mayúsculas. También se permite el uso de espacios en los nombres de usuario.
2) El manejo de sesión con el frontend se realiza a través de un objecto encodeado (JSON string).
3) La llamada al endpoint ```/popular_cat_facts/``` retorna los Cat Facts con más likes, donde si dos Cat Facts tienen la misma cantidad de likes el criterio de desempate es la fecha de adición del Cat Fact a la base de datos, donde el más reciente será el con mayor jerarquía.

---
## Diagrama UML del sistema
El diagrama UML del sistema, correspondiente al modelo de datos de la aplicación, lo puedes encontrar en el siguiente [enlace](https://drive.google.com/file/d/1JDa5_QdwKNSWkw8QOqdZqINEHdJjU3-v/view?usp=sharing).

---
## Metodología de trabajo
1) El diseño del software está basado en las prácticas de SOLID.
2) La convención de manejo de ramas se realizó a través de Git Flow siguiendo la convención de ramas y nombres de commits de [DeepSource](https://deepsource.io/blog/git-branch-naming-conventions/). El diagrama del flujo de ramas se puede encontrar en el siguiente [enlace](https://github.com/MGome/sscatfacts-backend/network).


---
## Revisión de calidad de código
Para mantener correctas prácticas de desarrollo se integró rubocop al proyecto, para realizar la revisión de acuerdo a las reglas predefinidas debes ejecutar el comando:
```
rubocop
```

---
## Testing
Para la ejecución de los tests debes ejecutar el comando:
```
bundle exec rspec
```
