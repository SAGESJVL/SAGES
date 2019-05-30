/*CREATE DATABASE DLAB;

USE DLAB
GO

*/

CREATE TABLE ESTADO(
idEstado int identity(1,1),
descripcionEstado varchar(30),
fechaCreacion datetime default getDate() not null,
CONSTRAINT PK_ESTADO PRIMARY KEY (idEstado, descripcionEstado),
);

CREATE TABLE PERFIL(
idPerfil int identity(1,1),
tipoPerfil varchar(30),
fechaCreacion datetime default getDate() not null,
CONSTRAINT PK_PERFIL PRIMARY KEY (idPerfil, tipoPerfil)
);


CREATE TABLE USUARIO(
rut varchar(10),
nombre varchar(50) not null,
apellido varchar(50) not null,
correoElectronico varchar(80), --considerar aquellos casos excepcionales 
clave varchar(50) not null,
estado varchar(30) not null,
tipoPerfil varchar(30) not null,
intentosFallidos int,
fechaCreacion datetime default getDate()  not null,
fechaModificacion datetime,
usuarioModificacion varchar not null,
CONSTRAINT PK_RutCorreo PRIMARY KEY (rut, correoElectronico),
CONSTRAINT FK_UsuarioPerfil FOREIGN KEY (tipoPerfil) REFERENCES Perfil(tipoPerfil),
CONSTRAINT FK_UsuarioEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE SOLICITUD(
idSolicitud int identity(1,1) Primary Key,
estado varchar(15),
usuarioAprobador varchar(10),
usuarioSolicitante varchar(10),
/*sala
cupos
horario
fecha
*/
CONSTRAINT FK_SolicitudUsuarioAprobador FOREIGN KEY (usuarioAprobador) REFERENCES Usuario(rut),
CONSTRAINT FK_SolicitudUsuarioSolicitante FOREIGN KEY (usuarioSolicitante) REFERENCES Usuario(rut)
);

CREATE TABLE AREA(
idArea int identity(1,1),
descripcionArea varchar(100) not null,
CONSTRAINT PK_idArea PRIMARY KEY (idArea, descripcionArea)
);

CREATE TABLE INFORME(
idInforme int identity(1,1),
descripcionInforme varchar(100) not null,
fechaCreacion datetime default getDate()  not null,
estado varchar(30) not null,
area varchar(50) not null,
CONSTRAINT PK_idDescripcion PRIMARY KEY (idInforme, descripcionInforme),
CONSTRAINT FK_InformeEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado),
CONSTRAINT FK_InformeArea FOREIGN KEY (area) REFERENCES Area(descripcionArea)
);

CREATE TABLE SALA(
idSala int identity(1,1),
nombre varchar(30) not null,
estado varchar(30) not null,
capacidad int,
CONSTRAINT PK_idDescripcion PRIMARY KEY (idSala, nombre),
CONSTRAINT FK_SalaEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE MODALIDAD(
idModalidad int identity(1,1),
descripcionModalidad varchar(30) not null,
CONSTRAINT PK_idModalidadDescripcion PRIMARY KEY (idModalidad, descripcionModalidad)
);

CREATE TABLE RESERVA(
idReserva int identity(1,1),
fechaInicio datetime not null,
fechaTermino datetime not null,
horaTermino time,
horaInicio time,
responsable varchar(10),
modalidad varchar(30) not null,
estado varchar(30) not null,
CONSTRAINT FK_ReservasEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado),
CONSTRAINT FK_ReservaResponsable FOREIGN KEY (responsable) REFERENCES Usuario(rut)
CONSTRAINT FK_ReservaModalidad FOREIGN KEY (modalidad) REFERENCES Modalidad(descripcionModalidad)
);

CREATE TABLE ACTIVIDAD(
idActividad  int identity(1,1),
tipoActividad varchar(50) not null,
CONSTRAINT PK_idActividadTipo PRIMARY KEY (idActividad, tipoActividad)
);

CREATE TABLE RECURSO(
idRecurso int identity(1,1),
descripcionRecurso varchar(50) not null,
--vigencia 
fechaCompra datetime default getDate()  not null,
cantidad int,
marca varchar(50) not null,
tipo  varchar(50) not null,
ubicacion nombre varchar(30) not null,
CONSTRAINT PK_IdRecursoDescripcion PRIMARY KEY (idRecursos, descripcionRecurso)
CONSTRAINT FK_RecursoUbicacion FOREIGN KEY (ubicacion) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE INSUMO(
idInsumo int identity(1,1),
descripcionInsumos varchar(50) not null,
--rendimiento
tipo
cantidad,
CONSTRAINT PK_idInsumoDescripcion PRIMARY KEY (idInsumo)
);

CREATE TABLE PROVEEDOR(
idProveedor int identity(1,1),
nombreProveedor varchar(50) not null,
rutProveedor varchar(50) not null,
CONSTRAINT PK_idProveedorRut PRIMARY KEY (idProveedor, rut)
);

/*
CREATE TABLE MARCA(
idMarca int identity(1,1),
nombreMarca varchar(50) not null,
CONSTRAINT PK_idMarcaNombre PRIMARY KEY (idMarca, nombreMarca)
);
*/

/*
ROLES Y PERFILES
*/


INSERT INTO PERFIL (tipoPerfil) VALUES ('Administrador'); --1
INSERT INTO PERFIL (tipoPerfil) VALUES ('Docente'); --2 
INSERT INTO PERFIL (tipoPerfil) VALUES ('Docente Administrador'); --3 

CREATE TABLE MENU (
idMenu int identity(1,1),
descripcionMenu varchar(50) not null,
CONSTRAINT PK_idMenuDescripcion PRIMARY KEY (idMenu, descripcionMenu)
);

INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Salas'); --1
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Docentes'); --2
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Insumos'); --3
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Maquinarias'); --4
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Usuarios'); --5
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Reportes'); -- 6
INSERT INTO MENU (descripcionMenu) VALUES ('Solicitud de Reservas'); --7
INSERT INTO MENU (descripcionMenu) VALUES ('Revisión de Reservas'); --8
INSERT INTO MENU (descripcionMenu) VALUES ('Calendario'); --9


CREATE TABLE MENU_PERFIL(
descripcionMenu int identity(1,1),
descripcionPerfil int identity(1,1)
CONSTRAINT FK_MenuPerfil_idMenu FOREIGN KEY (descripcionMenu) REFERENCES MENU(descripcionMenu),
CONSTRAINT FK_MenuPerfil_idPerfil FOREIGN KEY (descripcionPerfil) REFERENCES Perfil(descripcionPerfil)
);

INSERT INTO MENU_PERFIL () VALUES (
);

/*
Considerar mejoras de permisos como auditor o consulta
*/

INSERT INTO ROL () vVALUES ();

CREATE TABLE PERFIL(
idPerfil int identity(1,1),
tipoPerfil varchar(30),
fechaCreacion datetime default getDate() not null,
CONSTRAINT PK_PERFIL PRIMARY KEY (idPerfil, tipoPerfil)
);