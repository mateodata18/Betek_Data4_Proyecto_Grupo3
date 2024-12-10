CREATE DATABASE HORIZONTE;
USE HORIZONTES;

--CREAR TABLA CLIENTE

  CREATE TABLE Cliente(
   ID_Cliente INT PRIMARY KEY NOT NULL,
   Nombre VARCHAR (50) NOT NULL,
   Apellido VARCHAR (50) NOT NULL,
   Direccion VARCHAR (50),
   Telefono INT NOT NULL,
   Email VARCHAR (50) NOT NULL,
   Tipo_Cliente VARCHAR (50),
   );

   --CREAR TABLA FORMADOR
   CREATE TABLE Formador(
   ID_Formador INT PRIMARY KEY NOT NULL,
   Nombre VARCHAR (50) NOT NULL,
   Apellido VARCHAR (50) NOT NULL,
   Especializacion VARCHAR (50) NOT NULL,
   Ano_Experiencia INT NOT NULL,
   );

   --CREAR TABLA EMPRESA
   CREATE TABLE Empresa(
   ID_Empresa INT PRIMARY KEY NOT NULL,
   Nombre VARCHAR (50) NOT NULL,
   Nit INT NOT NULL,
   Direccion VARCHAR (50) NOT NULL,
   Telefono INT NOT NULL, 
   );

   --CREAR TABLA CURSO
   CREATE TABLE Curso(
   ID_Curso INT  PRIMARY KEY NOT NULL,
   Nombre VARCHAR (50) NOT NULL,
   Descripcion VARCHAR (250) NOT NULL,
   Duracion_Semanas INT NOT NULL,
   Fecha_Inicio DATE NOT NULL,
   Hora_Inicio TIME NOT NULL,
   Hora_Fin DATE NOT NULL,
   Area VARCHAR (50) NOT NULL,
   Dia_Semana VARCHAR (15) NOT NULL,
   );

   --CREAR TABLA INTERMERDIA CURSO-FORMADOR
   CREATE TABLE Curso_Formador(
   ID_Curso INT NOT NULL, 
   ID_Formador INT NOT NULL,
   Ubicacion VARCHAR (50) NOT NULL,
   FOREIGN KEY (ID_Curso) REFERENCES Curso (ID_Curso),
   FOREIGN KEY ( ID_Formador) REFERENCES Formador ( ID_Formador),
   );

   

   --CREAR TABLA INSCRIPCION
   CREATE TABLE Inscripcion(
   ID_Inscripcion INT PRIMARY KEY NOT NULL,
   ID_Cliente INT NOT NULL,
   ID_Empresa INT NOT NULL,
   ID_Curso INT NOT NULL, 
   Fecha_Inscripcion DATE NOT NULL,
   Estado_Inscripcion VARCHAR (30) NOT NULL,
   FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente),
  -- FOREIGN KEY (ID_Inscripcion) REFERENCES Inscripcion_curso (ID_Inscripcion),
   FOREIGN KEY (ID_Empresa) REFERENCES Empresa (ID_Empresa),
  );

  --CREAR TABLA INSCRIPCION -CURSO
  CREATE TABLE Inscripcion_curso(
  ID_Inscripcion INT NOT NULL,
  ID_Curso INT NOT NULL,
  Calificacion INT NOT NULL,
  FOREIGN KEY (ID_Inscripcion) REFERENCES Inscripcion (ID_Inscripcion),
  FOREIGN KEY (ID_Curso) REFERENCES Curso (ID_Curso),
  );


  --CREAR TABLA FACTURA
  CREATE TABLE Factura(
  ID_Factura INT PRIMARY KEY NOT NULL,
  ID_Inscripcion INT NOT NULL, 
  Pago_Cantidad NUMERIC (8,2) NOT NULL,
  Fecha_Factura DATE NOT NULL,
  FOREIGN KEY (ID_Inscripcion) REFERENCES Inscripcion (ID_Inscripcion),
  );

  --CREAR TABLA PAGO
  CREATE TABLE Pago (
  ID_Pago INT PRIMARY KEY NOT NULL,
  ID_Factura INT NOT NULL,
  Fecha_Pago DATE NOT NULL,
  Metodo_Pago VARCHAR (50) NOT NULL,
  Estado_pago VARCHAR (50) NOT NULL,
  FOREIGN KEY (ID_Factura) REFERENCES Factura (ID_Factura),
  );

  --CREAR TABLA CERTIFICADO
  CREATE TABLE Certificado(
  ID_Certificado INT PRIMARY KEY NOT NULL,
  ID_Inscripcion INT NOT NULL,
  Fecha_Expedicion DATE NOT NULL,
  FOREIGN KEY (ID_Inscripcion) REFERENCES Inscripcion (ID_Inscripcion),
  );

  SELECT *
  FROM Certificado
