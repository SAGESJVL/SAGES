/*CREATE DATABASE DLAB;

USE DLAB
GO

*/

CREATE TABLE ESTADO(
idEstado int identity(1,1),
descripcionEstado varchar(30),
fechaCreacion datetime default getDate() not null,
CONSTRAINT PK_ESTADO PRIMARY KEY (descripcionEstado),
);

CREATE TABLE PERFIL(
idPerfil int identity(1,1),
tipoPerfil varchar(30),
fechaCreacion datetime default getDate() not null,
CONSTRAINT PK_PERFIL PRIMARY KEY (tipoPerfil)
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
CONSTRAINT PK_RutCorreo PRIMARY KEY (rut),
CONSTRAINT FK_UsuarioPerfil FOREIGN KEY (tipoPerfil) REFERENCES Perfil(tipoPerfil),
CONSTRAINT FK_UsuarioEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE SOLICITUD(
idSolicitud int identity(1,1),
estado varchar(15), 
usuarioAprobador varchar(10),
usuarioSolicitante varchar(10),
/*sala
cupos
horario
fecha
*/
CONSTRAINT PK_SolicitudId PRIMARY KEY (idSolicitud),
CONSTRAINT FK_SolicitudUsuarioAprobador FOREIGN KEY (usuarioAprobador) REFERENCES Usuario(rut),
CONSTRAINT FK_SolicitudUsuarioSolicitante FOREIGN KEY (usuarioSolicitante) REFERENCES Usuario(rut),
CONSTRAINT FK_SolicitudEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE AREA(
idArea int identity(1,1),
descripcionArea varchar(100) not null,
CONSTRAINT PK_idArea PRIMARY KEY (descripcionArea)
);

CREATE TABLE INFORME(
idInforme int identity(1,1),
descripcionInforme varchar(100),
fechaCreacion datetime default getDate()  not null,
estado varchar(30),
area varchar(50) not null,
CONSTRAINT PK_idDescripcion PRIMARY KEY (idInforme, descripcionInforme),
CONSTRAINT FK_InformeEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado),
CONSTRAINT FK_InformeArea FOREIGN KEY (area) REFERENCES Area(descripcionArea)
);

CREATE TABLE SALA(
idSala int identity(1,1),
nombre varchar(30) not null,
estado varchar(30),
capacidad int,
CONSTRAINT PK_idDescripcion PRIMARY KEY (idSala, nombre),
CONSTRAINT FK_SalaEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE MODALIDAD(
idModalidad int identity(1,1),
descripcionModalidad varchar(30) not null,
CONSTRAINT PK_idModalidadDescripcion PRIMARY KEY (descripcionModalidad)
);

CREATE TABLE ACTIVIDAD(
idActividad  int identity(1,1),
tipoActividad varchar(50) not null,
CONSTRAINT PK_idActividadTipo PRIMARY KEY (tipoActividad)
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
tipoActividad varchar(50) not null,,
CONSTRAINT FK_ReservasEstado FOREIGN KEY (estado) REFERENCES Estado(descripcionEstado),
CONSTRAINT FK_ReservaResponsable FOREIGN KEY (responsable) REFERENCES Usuario(rut)
CONSTRAINT FK_ReservaModalidad FOREIGN KEY (modalidad) REFERENCES Modalidad(descripcionModalidad),
CONSTRAINT FK_ReservaActividad FOREIGN KEY (tipoActividad) REFERENCES Actividad(tipoActividad)
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
CONSTRAINT PK_IdRecursoDescripcion PRIMARY KEY (descripcionRecurso),
CONSTRAINT FK_RecursoUbicacion FOREIGN KEY (ubicacion) REFERENCES Estado(descripcionEstado)
);

CREATE TABLE INSUMO(
idInsumo int identity(1,1),
descripcionInsumos varchar(50) not null,
--rendimiento, cantidad
tipo varchar(30) not null,
cantidad] int null,
unidadMedida varchar(15) null,
CONSTRAINT PK_idInsumoDescripcion PRIMARY KEY (idInsumo),
CONSTRAINT FK_insumoUnidadMedida FOREIGN KEY (unidadMedida) REFERENCES UNIDAD_MEDIDA(unidadMedida)
);


CREATE TABLE SALA(
idSala int IDENTITY(1,1) NOT NULL,
nombre varchar(30) NOT NULL,
estado varchar(30) NOT NULL,
capacidad int NULL,
descripcionSala [varchar](200) NULL,
CONSTRAINT PK_idDescripcion PRIMARY KEY (nombre)
);

/*PENDIENTE DE STOCK*/

CREATE TABLE PROVEEDOR(
idProveedor int identity(1,1),
nombreProveedor varchar(50) not null,
rutProveedor varchar(50) not null,
CONSTRAINT PK_idProveedorRut PRIMARY KEY (rut)
);

CREATE TABLE INSUMO_PROVEEDOR(
idInsumo int,
idProveedor int,
CONSTRAINT FK_InsumoProveedor_idInsumo FOREIGN KEY (idInsumo) REFERENCES Insumo(idInsumo),
CONSTRAINT FK_InsumoProveedor_idIProveedor FOREIGN KEY (idInsumo) REFERENCES Insumo(idInsumo)
);

CREATE TABLE UNIDAD_MEDIDA(
idMedida int identity(1,1),
descripcionMedida varchar(15) not null,
CONSTRAINT PK_idDescripcion PRIMARY KEY (descripcionMedida)
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

CREATE TABLE MENU (
idMenu int identity(1,1),
descripcionMenu varchar(50) not null,
CONSTRAINT PK_idMenuDescripcion PRIMARY KEY (descripcionMenu)
);


CREATE TABLE MENU_PERFIL(
descripcionMenu int identity(1,1),
descripcionPerfil int identity(1,1)
CONSTRAINT FK_MenuPerfil_idMenu FOREIGN KEY (descripcionMenu) REFERENCES MENU(descripcionMenu),
CONSTRAINT FK_MenuPerfil_idPerfil FOREIGN KEY (descripcionPerfil) REFERENCES Perfil(descripcionPerfil)
);

CREATE TABLE PERFIL(
idPerfil int identity(1,1),
tipoPerfil varchar(30),
fechaCreacion datetime default getDate() not null,
CONSTRAINT PK_PERFIL PRIMARY KEY (tipoPerfil)
);
