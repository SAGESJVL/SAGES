
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