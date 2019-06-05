
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