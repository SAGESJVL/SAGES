USE [DLab]
GO
/****** Object:  StoredProcedure [dbo].[Insumo_TraerTodo]    Script Date: 05-06-2019 15:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laura Péndola
-- Create date: 05/06/2019
-- Description:	Trae todos los registros de la tabla Insumos
-- =============================================
CREATE PROCEDURE [dbo].[Insumo_TraerTodo] 
	
AS
BEGIN
	SELECT
		idInsumo as "Id Insumo",
		descripcionInsumos as "Descripcion",
		tipo as "Tipo",
		Cantidad as "Cantidad Disponible",
		unidadMedida as "Unidad de Medida"
	FROM
		dbo.INSUMO
END

GO
/****** Object:  StoredProcedure [dbo].[Usuario_Cambia_Contraseña]    Script Date: 05-06-2019 15:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laura Péndola
-- Create date: 279/05/2019
-- Description:	Cambia contraseña de usuario.
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Cambia_Contraseña](
	@cuenta varchar(80),
	@tipoAcceso varchar(6),
	@passNueva varchar(50)
) 
AS
IF @tipoAcceso = 'rut'
	BEGIN
		UPDATE 
			[dbo].[USUARIO]
		SET
			clave = @passNueva
		where
			rut = @cuenta
	END
ELSE
	BEGIN
		UPDATE
			[dbo].[USUARIO]
		SET
			clave = @passNueva
		where
			correoElectronico = @cuenta
	END

SET NOCOUNT ON;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Crear]    Script Date: 05-06-2019 15:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
-- =============================================
-- Author:		Laura Péndola
-- Create date: 02/06/2019
-- Description:	Verifica que exista usuario en la BD.
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Existe](
	@rut varchar(10)	
) 
AS
BEGIN
	SELECT
		*
	FROM
		dbo.USUARIO
	WHERE
		rut = @rut
		
END
SET NOCOUNT ON;
GO
/****** Object:  StoredProcedure [dbo].[Usuario_Login]    Script Date: 05-06-2019 15:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laura Péndola
-- Create date: 27/05/2019
-- Description:	Determina si el usuario y contraseña ingresados, corresponden a algun registro de la tabla USUARIO
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Login](
	@cuenta varchar(80),
	@pass varchar(50),
	@tipoAcceso varchar(6)
) 
AS
IF @tipoAcceso = 'rut'
	BEGIN
		SELECT
			*
		FROM
			[dbo].[USUARIO]
		where
			rut = @cuenta and clave = @pass
	END
ELSE
	BEGIN
		SELECT
			*
		FROM
			[dbo].[USUARIO]
		where
			correoElectronico = @cuenta and clave = @pass
	END

SET NOCOUNT ON;

GO
/****** Object:  StoredProcedure [dbo].[Usuario_Modificar]    Script Date: 05-06-2019 15:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Laura Péndola
-- Create date: 02/06/2019
-- Description:	Cambia contraseña de usuario.
-- =============================================
CREATE PROCEDURE [dbo].[Usuario_Modificar](
	@rut varchar(10),
	@nombre varchar(50),
	@apellido varchar(50),
	@correoActual varchar(80),
	@correoNuevo varchar(80),
	@clave varchar(50),
	@estado varchar(30),
	@tipoPerfil varchar(30),	
	@usuarioModificacion varchar(10)
) 
AS
BEGIN
	UPDATE
		dbo.USUARIO
	SET		
		nombre = @nombre,
		apellido = @apellido,
		correoElectronico = @correoNuevo,
		clave = @clave,
		estado = @estado,
		tipoPerfil = @tipoPerfil,
		fechaModificacion = GETDATE(),
		usuarioModificacion = @usuarioModificacion
	WHERE
		rut = @rut and
		correoElectronico = @correoActual
		
END