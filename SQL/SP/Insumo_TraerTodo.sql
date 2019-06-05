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