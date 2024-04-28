# Tarea: Introducción a XPath

- Módulo profesional: Lenguajes de Marcas y Sistemas de Gestión de Información
- Ciclo formativo: Desarrollo de Aplicaciones Web
- Autor: Rodrigo Mulero García
- Fecha: 29/03/2024

## Actividad 1
<details>
<summary>EXPANDIR ACTIVIDAD</summary>

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

<details>
<summary>Documento XML</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ies>
  <nombre>Campus Digital</nombre>
  <web>https://campusdigitalfp.com/</web>
  <ciclos>
    <ciclo id="ASIR">
      <nombre>Administración de Sistemas Informáticos en Red</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2009" />
    </ciclo>
    <ciclo id="DAM">
      <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2010" />
    </ciclo>
    <ciclo id="SMR">
      <nombre>Sistemas Microinformáticos y Redes</nombre>
      <grado>Medio</grado>
      <decretoTitulo año="2008" />
    </ciclo>
  </ciclos>
</ies>
```
</details>


### Actividad 1.1

Nombre del instituto.

<details>
Salida esperada:

```xml
<nombre>Campus Digital</nombre>
```

Consulta XPath:

```xpath
/ies/nombre
```

Salida real:

```xml
<nombre>Campus Digital</nombre>
```
</details>

### Actividad 1.2

Página web del Instituto.

<details>
Salida esperada:

```plaintext
https://campusdigitalfp.com/
```

Consulta XPath:

```xpath
//web/text()
```

Salida real:

```xml
https://campusdigitalfp.com/
```
</details>

### Actividad 1.3

Nombre de los Ciclos Formativos.

<details>
Salida esperada:

```plaintext
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```

Consulta XPath:

```xpath
//ciclos/ciclo/nombre/text()
```

Salida real:

```xml
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```
</details>

### Actividad 1.4

Siglas por las que se conocen los Ciclos Formativos.

<details>
Salida esperada:

```xpath
id="ASIR"
id="DAM"
id="SMR"
```

Consulta XPath:

```xpath
//ciclos/ciclo/@id
```

Salida real:´

```xml
id="ASIR"
id="DAM"
id="SMR"
```
</details>

### Actividad 1.5

Años en los que se publicaron los decretos de título de los Ciclos Formativos.

<details>
Salida esperada:

```xpath
año="2009"
año="2010"
año="2008"
```

Consulta XPath:

```xpath
//ciclos/ciclo/decretoTitulo/@año
```

Salida real:

```xml
año="2009"
año="2010"
año="2008"
```
</details>

### Actividad 1.6

Ciclos Formativos de Grado Medio (se trata de obtener el elemento `<ciclo>` completo).

<details>
Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```xml
<ciclo id="SMR">
  <nombre>Sistemas Microinformáticos y Redes</nombre>
  <grado>Medio</grado>
  <decretoTitulo año="2008"/>
</ciclo>
```

Consulta XPath en un paso:

```xpath
//ciclo[grado='Medio']
```

Consulta XPath en dos pasos:

```xpath
//grado[text()='Medio']/..
```

Salida real:

```xml
<ciclo id="SMR">
      <nombre>Sistemas Microinformáticos y Redes</nombre>
      <grado>Medio</grado>
      <decretoTitulo año="2008"/>
    </ciclo>
```
</details>

### Actividad 1.7

Nombre de los Ciclos Formativos de Grado Superior.

<details>
Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```xml
<nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
<nombre>Administración de Sistemas Informáticos en Red</nombre>
```

Consulta XPath en un paso:

```xpath
/ies/ciclos/ciclo[grado="Superior"]/nombre
```

Consulta XPath en dos pasos:

```xpath
//grado[text()="Superior"]/../nombre
```

Salida real:

```xml
<nombre>Administración de Sistemas Informáticos en Red</nombre>
<nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
```
</details>

### Actividad 1.8

Nombre de los Ciclos Formativos anteriores a 2010.

<details>
Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```plaintext
Administración de Sistemas Informáticos en Red
Sistemas Microinformáticos y Redes
```

Consulta XPath en un paso:

```xpath
//ciclo[decretoTitulo/@año<2010]/nombre/node()
```

Consulta XPath en dos pasos:

```xpath
/ies/ciclos/ciclo/decretoTitulo[@año<2010]/../nombre/node()
```

Salida real:

```xml
Administración de Sistemas Informáticos en Red
Sistemas Microinformáticos y Redes
```
</details>

### Actividad 1.9

Nombre de los Ciclos Formativos de 2008 o 2010.

<details>
Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```plaintext
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```

Consulta XPath en un paso:

```xpath
//ciclo[decretoTitulo/@año=2010 or decretoTitulo/@año=2008]/nombre/node()
```

Consulta XPath en dos pasos:

```xpath
//decretoTitulo[@año=2010 or @año=2008]/../nombre/node()
```

Salida real:

```xml
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```
</details>


### Actividad 1.9 (BIS?)

Invéntate tu propia consulta.
>Obtener todos los nombres de los ciclos que contengan la palabra "informáticos", no case-sensitive.
>>Se trata de una consulta avanzada que puede no mostrarse en todos los visores. [http://xpather.com ](Recomendado)

<details>

Salida esperada:

```xml
<nombre>Administración de Sistemas Informáticos en Red</nombre>
<nombre>Sistemas Microinformáticos y Redes</nombre>
```

Consulta XPath:

```xpath
//nombre[contains(lower-case(text()), 'informáticos')]
```
</details>

</details>

## Actividad 2
<details>
<summary>EXPANDIR ACTIVIDAD</summary>

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

<details>
<summary>Documento XML</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ies>
  <modulos>
    <modulo id="0228">
      <nombre>Aplicaciones web</nombre>
      <curso>2</curso>
      <horasSemanales>4</horasSemanales>
      <ciclo>SMR</ciclo>
    </modulo>
    <modulo id="0372">
      <nombre>Gestión de bases de datos</nombre>
      <curso>1</curso>
      <horasSemanales>5</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
    <modulo id="0373">
      <nombre>Lenguajes de marcas y sistemas de gestión de información</nombre>
      <curso>1</curso>
      <horasSemanales>3</horasSemanales>
      <ciclo>ASIR</ciclo>
      <ciclo>DAW</ciclo>
    </modulo>
    <modulo id="0378">
      <nombre>Seguridad y Alta Disponibilidad</nombre>
      <curso>2</curso>
      <horasSemanales>2</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
  </modulos>
</ies>
```
</details>

### Actividad 2.1

Nombre de los módulos que se imparten en el Instituto.

<details>
Salida esperada:

```plaintext
Aplicaciones web
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo/nombre/node()
```

Salida real:

```xml
Aplicaciones web
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
</details>

### Actividad 2.2

Nombre de los módulos del ciclo ASIR.

<details>
Salida esperada:

```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo[ciclo="ASIR"]/nombre/node()
```

Salida real:

```xml
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
</details>

### Actividad 2.3

Nombre de los módulos que se imparten en el segundo curso de cualquier ciclo.

<details>
Salida esperada:

```plaintext
Aplicaciones web
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo[curso="2"]/nombre/node()
```

Salida real:

```xml
Aplicaciones web
Seguridad y Alta Disponibilidad
```
</details>

### Actividad 2.4

Nombre de los módulos de menos de 5 horas semanales.

<details>
Salida esperada:

```plaintext
Aplicaciones web
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo[horasSemanales<5]/nombre/node()
```

Salida real:

```xml
Aplicaciones web
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
</details>

### Actividad 2.5

Nombre de los módulos que se imparten en el primer curso de ASIR.

<details>
Salida esperada:

```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
```

Consulta XPath:

```xpath
//modulo[ciclo="ASIR" and curso="1"]/nombre/node()
```

Salida real:

```xml
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
```
</details>

### Actividad 2.6

Horas semanales de los módulos de más de 3 horas semanales.

<details>
Salida esperada:

```plaintext
4
5
```

Consulta XPath:

```xpath
//modulo[horasSemanales>3]/horasSemanales/node()
```

Salida real:

```xml
4
5
```
</details>

### Actividad 2.7

Invéntate tu propia consulta.

>Nombre de los módulos con id mayor que 372.

<details>
Salida esperada:

```plaintext
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo[@id>372]/nombre/node()
```

Salida real:

```xml
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
</details>
</details>

## Actividad 3
<details>
<summary>EXPANDIR ACTIVIDAD</summary>

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

<details>
<summary>Documento XML</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ies>
  <nombre>Campus Digital</nombre>
  <web>https://campusdigitalfp.com/</web>
  <ciclos>
    <ciclo id="ASIR">
      <nombre>Administración de Sistemas Informáticos en Red</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2009" />
    </ciclo>
    <ciclo id="DAW">
      <nombre>Desarrollo de Aplicaciones Web</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2010" />
    </ciclo>
    <ciclo id="SMR">
      <nombre>Sistemas Microinformáticos y Redes</nombre>
      <grado>Medio</grado>
      <decretoTitulo año="2008" />
    </ciclo>
  </ciclos>
  <modulos>
    <modulo id="0228">
      <nombre>Aplicaciones web</nombre>
      <curso>2</curso>
      <horasSemanales>4</horasSemanales>
      <ciclo>SMR</ciclo>
    </modulo>
    <modulo id="0372">
      <nombre>Gestión de bases de datos</nombre>
      <curso>1</curso>
      <horasSemanales>5</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
    <modulo id="0373">
      <nombre>Lenguajes de marcas y sistemas de gestión de información</nombre>
      <curso>1</curso>
      <horasSemanales>3</horasSemanales>
      <ciclo>ASIR</ciclo>
      <ciclo>DAW</ciclo>
    </modulo>
    <modulo id="0378">
      <nombre>Seguridad y Alta Disponibilidad</nombre>
      <curso>2</curso>
      <horasSemanales>2</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
  </modulos>
</ies>
```
</details>

### Actividad 3.1

Nombre de los módulos del ciclo "Sistemas Microinformáticos y Redes" (en la expresión final no deben aparecer las siglas SMR).

<details>
Salida esperada:

```plaintext
Aplicaciones web
```

Consulta XPath:

```xpath
//modulo[not(ciclo="ASIR" or ciclo="DAW")]/nombre/node()
```

Salida real:

```xml
Aplicaciones web
```
</details>

### Actividad 3.2

Nombre de los ciclos que incluyen el módulo "Lenguajes de marcas y sistemas de gestión de información".

<details>
Salida esperada:

```plaintext
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Web
```

Consulta XPath:

```xpath
//ciclo[@id=//modulo[nombre="Lenguajes de marcas y sistemas de gestión de información"]/ciclo/node()]/nombre/node()
```

Salida real:

```xml
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Web´´
```
</details>

### Actividad 3.3

Nombre de los módulos de ciclos de Grado Superior.

<details>
Salida esperada:

```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo[ciclo=//ciclo[grado="Superior"]/@id]/nombre/node()
```
</details>

Salida real:

```xml
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```

### Actividad 3.4

Nombre de los módulos de ciclos cuyo título se aprobó en 2008.

<details>
Salida esperada:

```plaintext
Aplicaciones web
```

Consulta XPath:

```xpath
//modulo[ciclo=//decretoTitulo[@año="2008"]/../@id]/nombre/node()
```

Salida real:

```xml
Aplicaciones web
```
</details>

### Actividad 3.5

Grado de los ciclos con módulos de primer curso.

<details>
Salida esperada:

```plaintext
Superior
Superior
```

Consulta XPath:

```xpath
//ciclo[@id=//modulo[curso="1"]/ciclo/node()]/grado/node()
```

Salida real:

```xml
Superior
Superior
```
</details>

### Actividad 3.6

Invéntate tu propia consulta.
>Obtener el nombre del módulo con ID mayor de todos.
>>Se trata de una consulta avanzada que puede no mostrarse en todos los visores. [http://xpather.com ](Recomendado)

<details>

Salida esperada:

```plaintext
Seguridad y Alta Disponibilidad
```

Consulta XPath:

```xpath
//modulo[number(@id) = max(//modulo/number(@id))]/nombre/node()
```

Salida real:

```xml

```
</details>
</details>

## (Voluntaria) Actividad 4
<details>
<summary>EXPANDIR ACTIVIDAD</summary>

Dado el siguiente fichero XML:

<details>
<summary>Documento XML</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<universidad>

    <nombre>Universidad de Zaragoza</nombre>
    <pais>España</pais>

    <!-- GRADOS -->

    <grados>

        <grado id="g01">
            <nombre>Grado en Ingeniería Informática</nombre>
            <plan>2003</plan>
            <creditos>250</creditos>
            <centro>Escuela de Informática</centro>
        </grado>

        <grado id="g02">
            <nombre>Grado en Administración y Dirección de Empresas</nombre>
            <plan>2000</plan>
            <creditos>275</creditos>
            <centro>Facultad de Ciencias Sociales</centro>
        </grado>

        <grado id="g03">
            <nombre>Grado en Relaciones Laborales</nombre>
            <plan>2000</plan>
            <creditos>280</creditos>
            <centro>Facultad de Ciencias Sociales</centro>
            <subdirector>Alfonso Martín Luque</subdirector>
        </grado>

        <grado id="g04">
            <nombre>Grado en Quimica</nombre>
            <plan>2003</plan>
            <creditos>175</creditos>
            <centro>Facultad de Ciencias Experimentales</centro>
        </grado>

        <grado id="g05">
            <nombre>Grado en Biotecnología</nombre>
            <plan>2000</plan>
            <creditos>175</creditos>
            <centro>Facultad de Ciencias</centro>
        </grado>

        <grado id="g06">
            <nombre>Grado en Humanidades</nombre>
            <plan>1980</plan>
            <creditos>475</creditos>
            <centro>Facultad de Humanidades</centro>
        </grado>

    </grados>

    <!-- ASIGNATURAS -->

    <asignaturas>

        <asignatura id="a01" titulacion="g01">
            <nombre>Ofimática</nombre>
            <creditosTeoricos>3</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a02" titulacion="g01">
            <nombre>Ingeniería del Software</nombre>
            <creditosTeoricos>6</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a03" titulacion="g02">
            <nombre>Administración de Empresas</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a04" titulacion="g02">
            <nombre>Derecho Internacional</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a05" titulacion="g04">
            <nombre>Pedagogía</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a06" titulacion="g03">
            <nombre>Didáctica</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>3</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a07" titulacion="g04">
            <nombre>Tecnología de los Alimentos</nombre>
            <creditosTeoricos>1.5</creditosTeoricos>
            <creditosPracticos>7.5</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a08" titulacion="g01">
            <nombre>Bases de Datos</nombre>
            <creditosTeoricos>4.5</creditosTeoricos>
            <creditosPracticos>5.5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a09" titulacion="g06">
            <nombre>Historia del Pensamiento</nombre>
            <creditosTeoricos>6</creditosTeoricos>
            <creditosPracticos>0</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

    </asignaturas>

    <!-- ALUMNOS -->

    <alumnos>

        <alumno id="e01">
            <apellido1>Rivas</apellido1>
            <apellido2>Santos</apellido2>
            <nombre>Víctor Manuel</nombre>
            <sexo>Hombre</sexo>
            <estudios>
                <grado codigo="g01" />
                <asignaturas>
                    <asignatura codigo="a01" />
                    <asignatura codigo="a03" />
                    <asignatura codigo="a05" />
                    <asignatura codigo="a09" />
                </asignaturas>
            </estudios>
        </alumno>

        <alumno id="e02">
            <apellido1>Pérez</apellido1>
            <apellido2>García</apellido2>
            <nombre>Luisa</nombre>
            <sexo>Mujer</sexo>
            <estudios>
                <grado codigo="g02" />
                <asignaturas>
                    <asignatura codigo="a02" />
                    <asignatura codigo="a01" />
                </asignaturas>
                <proyecto>Web de IBM.com</proyecto>
            </estudios>

        </alumno>

        <alumno id="e03" beca="si">
            <apellido1>Pérez</apellido1>
            <apellido2>Romero</apellido2>
            <nombre>Fernando</nombre>
            <sexo>Hombre</sexo>
            <estudios>
                <grado codigo="g02" />
                <asignaturas>
                    <asignatura codigo="a02" />
                    <asignatura codigo="a01" />
                    <asignatura codigo="a04" />
                    <asignatura codigo="a09" />
                </asignaturas>
            </estudios>
        </alumno>

        <alumno id="e04">
            <apellido1>Avalón</apellido1>
            <apellido2>Jiménez</apellido2>
            <nombre>María</nombre>
            <sexo>Mujer</sexo>
            <estudios>
                <grado codigo="g01" />
                <asignaturas>
                    <asignatura codigo="a02" />
                    <asignatura codigo="a01" />
                    <asignatura codigo="a07" />
                </asignaturas>
                <proyecto>Estudio de Salinidad del Pantano Iris</proyecto>
            </estudios>
        </alumno>

    </alumnos>

</universidad>
```
</details>

Obtén la siguiente información.

### Actividad 4.01

Nombre de la Universidad.

<details>

Salida esperada:

```plaintext
Universidad de Zaragoza
```

Consulta XPath:

```xpath
/universidad/nombre/node()
```
</details>

### Actividad 4.02

País de la Universidad.

<details>

Salida esperada:

```plaintext
España
```

Consulta XPath:

```xpath
/universidad/pais/node()
```
</details>

### Actividad 4.03

Nombres de los grados.

<details>

Salida esperada:

```plaintext
Grado en Ingeniería Informática
Grado en Administración y Dirección de Empresas
Grado en Relaciones Laborales
Grado en Quimica
Grado en Biotecnología
Grado en Humanidades
```

Consulta XPath:

```xpath
//grado/nombre/node()
```
</details>

### Actividad 4.04

Años de plan de estudio de los grados.

<details>

Salida esperada:

```plaintext
2003
2000
2000
2003
2000
1980
```

Consulta XPath:

```xpath
//grados/grado/plan/text()
```

Consulta XPath [v2.0](https://www.freeformatter.com/xpath-tester.html) eliminando duplicados.

Salida esperada:

```plaintext
2003
2000
1980
```

```xpath
distinct-values(//grados/grado/plan/text())
```
Consulta XPath [v2.0](https://www.freeformatter.com/xpath-tester.html) iterando por grupos y concatenando contenido de dos etiquetas.

Salida esperada:

```plaintext
2003 | Grado en Ingeniería Informática 
2000 | Grado en Administración y Dirección de Empresas 
2000 | Grado en Relaciones Laborales 
2003 | Grado en Quimica 
2000 | Grado en Biotecnología 
1980 | Grado en Humanidades
```

```xpath
for $g in //grados/grado return concat($g/plan/text(), ' | ', $g/nombre/text())
```

</details>

### Actividad 4.05

Nombres de todos los alumnos.

<details>

Salida esperada:

```plaintext
Víctor Manuel
Luisa
Fernando
María
```

Consulta XPath:

```xpath
//alumno/nombre/text()
```
</details>

### Actividad 4.06

Identificadores de todos los grados.

<details>

Salida esperada:

```plaintext
g01
g02
g03
g04
g05
g06
```

Consulta XPath:

```xpath
//grado/@id
```
</details>

### Actividad 4.07

Datos del grado cuyo id es g01.

<details>

Salida esperada:

```plaintext
<nombre>Grado en Ingeniería Informática</nombre>
<plan>2003</plan>
<creditos>250</creditos>
<centro>Escuela de Informática</centro>
```

Consulta XPath:

```xpath
//grado[@id="g01"]/* 
```

</details>

### Actividad 4.08

Centro en que se estudia el grado cuyo id es g02.

<details>

Salida esperada:

```plaintext
Facultad de Ciencias Sociales
```

Consulta XPath:

```xpath
//grado[@id="g02"]/centro/text()
```
</details>

### Actividad 4.09

Nombre de las grados que tengan subdirector.

<details>

Salida esperada:

```plaintext
Grado en Relaciones Laborales
```

Consulta XPath:

```xpath
//grado[subdirector]/nombre/text()
```
</details>

### Actividad 4.10

Nombre de los alumnos que estén haciendo proyecto.

<details>

Salida esperada:

```plaintext
Luisa
María
```

Consulta XPath:

```xpath
//alumno[estudios/proyecto]/nombre/text()
```
</details>

### Actividad 4.11

Códigos de los grados en los que hay algún alumno matriculado.

<details>

Salida esperada:

```plaintext
g01
g02
g02
g01
```

Consulta XPath:

```xpath
//alumno/estudios/grado/@codigo
```
</details>

### Actividad 4.12

Apellidos y Nombre de los alumnos con beca.

<details>

Salida esperada:

```plaintext
Pérez Romero, Fernando
```

Consulta XPath:

```xpath
//alumno[@beca="si"]/concat(apellido1, " " ,apellido2, ", " ,nombre)
```
</details>

### Actividad 4.13

Nombre de las asignaturas del grado g04.

<details>

Salida esperada:

```plaintext
Pedagogía
Tecnología de los Alimentos
```

Consulta XPath:

```xpath
//asignaturas/asignatura[@titulacion="g04"]/nombre/text()
```
</details>

### Actividad 4.14

Nombre de las asignaturas de segundo trimestre.

<details>

Salida esperada:

```plaintext
Ingeniería del Software
Pedagogía
Didáctica
Tecnología de los Alimentos
Historia del Pensamiento
```

Consulta XPath:

```xpath
//asignaturas/asignatura[trimestre="2"]/nombre/text()
```
</details>

### Actividad 4.15

Nombre de las asignaturas que no tienen 4 créditos teóricos.

<details>

Salida esperada:

```plaintext
Ofimática
Ingeniería del Software
Tecnología de los Alimentos
Bases de Datos
Historia del Pensamiento
```

Consulta XPath:

```xpath
//asignaturas/asignatura[creditosTeoricos!="4"]/nombre/text()
```
</details>

### Actividad 4.16

Código del grado que estudia el último alumno.

<details>

Salida esperada:

```plaintext
g01
```

Consulta XPath:

```xpath
//alumnos/alumno[last()]/estudios/grado/@codigo
```
</details>

### Actividad 4.17

Código de las asignaturas que estudian mujeres.

<details>

Salida esperada:

```plaintext
a02
a01
a02
a01
a07
```

Consulta XPath:

```xpath
//alumnos/alumno[sexo="Mujer"]//asignatura/@codigo
```
</details>

### Actividad 4.18

Nombre de los alumnos matriculados en la asignatura a02.

<details>

Salida esperada:

```plaintext
Víctor Manuel
Luisa
Fernando
María
```

Consulta XPath:

```xpath
//alumno[//asignatura/@codigo="a02"]/nombre/text()
```
</details>

### Actividad 4.19

Códigos de los grados que estudian los alumnos matriculados en alguna asignatura.

<details>

Salida esperada:

```plaintext
g01
g02
g02
g01
```

Consulta XPath:

```xpath
//alumno[//asignatura]//grado/@codigo
```
</details>

### Actividad 4.20

Apellidos de todos los hombres.

<details>

Salida esperada:

```plaintext
Rivas Santos
Pérez Romero
```

Consulta XPath [v2.0](https://www.freeformatter.com/xpath-tester.html) iterando por grupos y concatenando contenido de dos etiquetas.

```xpath
for $g in //alumnos/alumno[sexo="Hombre"] return concat($g/apellido1, " ", $g/apellido2)
```
>La solución para consultas XPath v1.0 devuelve los apellidos por separado, se podrían procesar posteriormente, pero no es lo ideal.
>>```xpath
>>//alumno[sexo='Hombre']/apellido1/text() | //alumno[sexo='Hombre']/apellido2/text()
>>```

</details>

### Actividad 4.21

Nombre de la grado que estudia Víctor Manuel.

<details>

Salida esperada:

```plaintext
Grado en Ingeniería Informática
```

Consulta XPath:

```xpath
//grados/grado[@id=//alumno[nombre="Víctor Manuel"]//grado/@codigo]/nombre/text()
```
</details>

### Actividad 4.22

Nombre de las asignaturas que estudia Luisa.

<details>

Salida esperada:

```plaintext
Ofimática
Ingeniería del Software
```

Consulta XPath:

```xpath
//asignaturas/asignatura[@id=//alumno[nombre="Luisa"]//asignatura/@codigo]/nombre/text()
```
</details>

### Actividad 4.23

Primer apellido de los alumnos matriculados en Ingeniería del Software.

<details>

Salida esperada:

```plaintext
Pérez
Pérez
Avalón
```

Consulta XPath:

```xpath
//alumno[descendant::*/@codigo=//asignaturas/asignatura[nombre="Ingeniería del Software"]/@id]/apellido1/text()
```
</details>

### Actividad 4.24

Nombre de los grados que estudian los alumnos matriculados en la asignatura Tecnología de los Alimentos.

<details>

Salida esperada:

```plaintext
Grado en Ingeniería Informática
```

Consulta XPath:

```xpath
//grado[@id=//alumno[.//@codigo=//asignatura[nombre="Tecnología de los Alimentos"]/@id]//grado/@codigo]/nombre/text()
```
</details>

### Actividad 4.25

Nombre de los alumnos matriculados en grados que no tienen subdirector.

<details>

Salida esperada:

```plaintext
Víctor Manuel
Luisa
Fernando
María
```

Consulta XPath:

```xpath
//alumno[.//grado/@codigo=//grado[not(subdirector)]/@id]/nombre/text()
```
</details>

### Actividad 4.26

Nombre de los alumnos matriculados en asignaturas con 0 créditos prácticos y que estudien el grado de Ingeniería Informática .

<details>

Salida esperada:

```plaintext
Víctor Manuel
```

Consulta XPath:

```xpath
//alumno[.//@codigo=//asignatura[creditosPracticos="0"]/@id and .//@codigo=//grado[nombre="Grado en Ingeniería Informática"]/@id]/nombre/text()
```
</details>

### Actividad 4.27

Nombre de los alumnos que estudian grados cuyos planes son anteriores a 2002.

<details>

Salida esperada:

```plaintext
Luisa
Fernando
```

Consulta XPath:

```xpath
//alumno[.//grado/@codigo=//grado[plan<2002]/@id]/nombre/text()
```
</details>

### Actividad 4.28

Invéntate tu propia consulta.
>Obtener un listado con el nombre de los alumnos y la suma de los creditos teoricos de todas las asignaturas en que estan matriculados.

<details>

Salida esperada:

```plaintext
Víctor Manuel: 17 
Luisa: 9 
Fernando: 19 
María: 10.5
```

Consulta XPath [v2.0](https://www.freeformatter.com/xpath-tester.html) iterando por alumnos, sumando los creditos de las asignaturas y concatenandolos con el nombre del alumno.

```xpath
for $a in //alumno return concat($a/nombre, ": ", sum(//asignatura[@id = $a//asignatura/@codigo]/creditosTeoricos))
```
</details>

</details>