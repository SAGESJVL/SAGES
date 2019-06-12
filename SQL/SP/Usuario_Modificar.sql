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