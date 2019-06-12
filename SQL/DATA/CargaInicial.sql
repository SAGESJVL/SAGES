
INSERT INTO [dbo].[ESTADO] ([idEstado], [descripcionEstado], [fechaCreacion]) VALUES (1, N'ACTIVO', CAST(0x0000AA5B001BACD4 AS DateTime))
INSERT INTO [dbo].[ESTADO] ([idEstado], [descripcionEstado], [fechaCreacion]) VALUES (3, N'BLOQUEADO', CAST(0x0000AA5B001BACD5 AS DateTime))
INSERT INTO [dbo].[ESTADO] ([idEstado], [descripcionEstado], [fechaCreacion]) VALUES (2, N'DESHABILITADO', CAST(0x0000AA5B001BACD5 AS DateTime))

INSERT INTO [dbo].[USUARIO] ([rut], [nombre], [apellido], [correoElectronico], [clave], [estado], [tipoPerfil], [intentosFallidos], [fechaCreacion], [fechaModificacion], [usuarioModificacion]) VALUES (N'16556569-k', N'Waldo', N'Pendola', N'ehtelewen@gmail.com', N'63y9xCsS9Z', N'ACTIVO', N'DOCENTE', NULL, CAST(0x0000AA61016A5071 AS DateTime), NULL, NULL)
INSERT INTO [dbo].[USUARIO] ([rut], [nombre], [apellido], [correoElectronico], [clave], [estado], [tipoPerfil], [intentosFallidos], [fechaCreacion], [fechaModificacion], [usuarioModificacion]) VALUES (N'17190472-2', N'Laura', N'Pendola', N'laura.pendola@inacapmail.cl', N'Azumanga7', N'ACTIVO', N'ADMINISTRADOR', NULL, CAST(0x0000AA5B001BACD5 AS DateTime), NULL, N'L')
INSERT INTO [dbo].[USUARIO] ([rut], [nombre], [apellido], [correoElectronico], [clave], [estado], [tipoPerfil], [intentosFallidos], [fechaCreacion], [fechaModificacion], [usuarioModificacion]) VALUES (N'17783235-9', N'Victoria', N'Fernandez', N'victoria.fernandez04@inacapmail.cl', N'Trini', N'ACTIVO', N'DOCENTE', NULL, CAST(0x0000AA5B00FC0FE9 AS DateTime), NULL, N'L')
INSERT INTO [dbo].[USUARIO] ([rut], [nombre], [apellido], [correoElectronico], [clave], [estado], [tipoPerfil], [intentosFallidos], [fechaCreacion], [fechaModificacion], [usuarioModificacion]) VALUES (N'23561732-3', N'Juan Pablo', N'Marin', N'juan.marin17@inacapmail.cl', N'Gatito', N'ACTIVO', N'DOCENTE-ADMINISTRADOR', NULL, CAST(0x0000AA5B014EDC25 AS DateTime), NULL, N'L')


INSERT INTO [dbo].[INSUMO] ([idInsumo], [descripcionInsumos], [tipo], [cantidad], [unidadMedida]) VALUES (1, N'PLA+ Negro', N'Filamento', 1, N'Rollo de kg')

INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Salas'); --1
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Docentes'); --2
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Insumos'); --3
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Maquinarias'); --4
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Usuarios'); --5
INSERT INTO MENU (descripcionMenu) VALUES ('Mantenedor de Reportes'); -- 6
INSERT INTO MENU (descripcionMenu) VALUES ('Solicitud de Reservas'); --7
INSERT INTO MENU (descripcionMenu) VALUES ('Revisión de Reservas'); --8
INSERT INTO MENU (descripcionMenu) VALUES ('Calendario'); --9


INSERT INTO [dbo].[PERFIL] ([idPerfil], [tipoPerfil], [fechaCreacion]) VALUES (1, N'ADMINISTRADOR', CAST(0x0000AA5B001BACD4 AS DateTime))
INSERT INTO [dbo].[PERFIL] ([idPerfil], [tipoPerfil], [fechaCreacion]) VALUES (2, N'DOCENTE', CAST(0x0000AA5B001BACD4 AS DateTime))
INSERT INTO [dbo].[PERFIL] ([idPerfil], [tipoPerfil], [fechaCreacion]) VALUES (3, N'DOCENTE-ADMINISTRADOR', CAST(0x0000AA5B001BACD4 AS DateTime))


INSERT INTO PERFIL (tipoPerfil) VALUES ('Administrador'); --1
INSERT INTO PERFIL (tipoPerfil) VALUES ('Docente'); --2 
INSERT INTO PERFIL (tipoPerfil) VALUES ('Docente Administrador'); --3 



INSERT INTO MENU_PERFIL () VALUES (
);

/*
Considerar mejoras de permisos como auditor o consulta
*/

INSERT INTO ROL () VALUES ();