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