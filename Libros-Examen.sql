CREATE DATABASE libros;

USE libros;
CREATE TABLE estudiantes(
	carne int(15) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(carne),
    nombre varchar(15) NOT NULL,
    apellido varchar(15) NOT NULL,
    direccion varchar(15) NOT NULL,
    telefono int(9) NOT NULL,
    email varchar(25) NOT NULL,
    fechanacimiento DATE,
    codigo_grado int(15)
);

CREATE TABLE grados(
	codigo_grado int(15) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(codigo_grado),
    nombre varchar(15) NOT NULL
);

CREATE TABLE prestamos(
	cod_prestamos int(15) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(cod_prestamos),
   	codigo_libro int(15),
    carne int(15),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    cod_empleado int(12)
);

CREATE TABLE empleados(
	cod_empleado int(12) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(cod_empleado),
    nombre varchar(15),
    apellido varchar(15),
    direccion varchar(25),
    email varchar(25)
);

CREATE TABLE estados(
    cod_estado int(8) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(cod_estado),
    nombre varchar(15)
);

CREATE TABLE libros(
	codigo_libro int(15) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(codigo_libro),
    codigo_autor int(10),
    codigo_editorial int(15),
    titulo varchar(25) NOT NULL,
    numero_paginas SMALLINT(5),
    tamanio varchar(10),
    precio float(4,2),
    estado int(8),
    edicion SMALLINT(5)
);

CREATE TABLE editoriales(
	codigo_editorial int(15) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(codigo_editorial),
    nombre varchar(20) NOT NULL,
    direccion varchar(25),
    telefono int(9) NOT NULL,
    email varchar(25)
);

CREATE TABLE autores(
	codigo_autor int(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(codigo_autor),
    apellido_autor varchar(15),
    nombre varchar(15) NOT NULL,
    pais_origen int(15)
);

CREATE TABLE paises(
	pais_origen int(15) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(pais_origen),
    nombre varchar(15)
);

ALTER TABLE estudiantes
ADD CONSTRAINT pk_fk_CodigoGrado FOREIGN KEY(codigo_grado) REFERENCES grados(codigo_grado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_Carne FOREIGN KEY(carne) REFERENCES estudiantes(carne) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_CodEmpleado FOREIGN KEY(cod_empleado) REFERENCES empleados(cod_empleado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_CodLibro FOREIGN KEY(codigo_libro) REFERENCES libros(codigo_libro) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_CodEstado FOREIGN KEY(estado) REFERENCES estados(cod_estado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_CodEditorial FOREIGN KEY(codigo_editorial) REFERENCES editoriales(codigo_editorial) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_CodAutor FOREIGN KEY(codigo_autor) REFERENCES autores(codigo_autor) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE autores
ADD CONSTRAINT pk_fk_CodPais FOREIGN KEY(pais_origen) REFERENCES paises(pais_origen) ON DELETE CASCADE ON UPDATE CASCADE;