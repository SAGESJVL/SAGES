-- =============================================
-- Author:		Laura Péndola
-- Create date: 02/06/2019
-- Description:	Crea usuario
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Crear](
	@rut varchar(10),
	@nombre varchar(50),
	@apellido varchar(50),
	@correo varchar(80),
	@clave varchar(50),
	@tipoPerfil varchar(30)
) 
AS
BEGIN
	INSERT INTO 
	dbo.USUARIO
	(
	rut,
	nombre,
	apellido,
	correoElectronico,
	clave,
	estado,
	tipoPerfil,
	fechaCreacion
	)
	VALUES
	(
	@rut,
	@nombre,
	@apellido,
	@correo,
	@clave,
	'ACTIVO',
	@tipoPerfil,
	GETDATE()
	)
END
SET NOCOUNT ON;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Existe]    Script Date: 05-06-2019 15:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO