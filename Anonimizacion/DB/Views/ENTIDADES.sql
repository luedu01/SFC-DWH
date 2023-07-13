REPLACE VIEW PROD_DWH_CONSULTA_SA.ENTIDADES(
    Ent_ID, 
    Nivel, 
    Grupo_Economico, 
    Grupo_Financiero, 
    Subgrupo_Financiero, 
    Tipo_Entidad, 
    Nombre_Tipo_Entidad,
    Codigo_Entidad,
    Sector, 
    Tipo_IDentificacion, 
    Numero_IDentificacion, 
    Nombre_Entidad, 
    Fecha_Act, 
    Fecha_Desde, 
    Fecha_Hasta, 
    Estado, 
    Vigente, 
    Delegatura, 
    Califica, 
    Criterio_Grupo, 
    Area_ID,
    Area_Nombre, 
    Emisor, 
    Nombre_Estado, 
    Vigilada, 
    Codigo_CIIU, 
    Domicilio)
    AS LOCKING ROW FOR ACCESS
    SELECT    ENT_ID,
        ENT_NIVEL,
        ENT_GRP_ECONO,
        ENT_GRP_FINAN,
        ENT_SUBG_FINAN,
        ENT_TIPO,
        ENT_TIPO_DESC,
        ENT_ENTIDAD,
        
        CASE
            WHEN ENT_TIPO IN(1,2, 4, 8, 32) THEN 'Establecimientos de Credito'
            WHEN ENT_TIPO IN(5) THEN 'Fiduciarias'
            WHEN ENT_TIPO IN(10, 13, 14, 15) THEN 'Seguros'
            WHEN ENT_TIPO = 22 THEN 'Intituciones Oficiales Especiales'
            WHEN ENT_TIPO = 23 THEN 'Administradoras Fondos de Pensiones'
            WHEN ENT_TIPO IN(85, 87) THEN 'Sociedades Comisionistas de Bolsa de Valores'
        ELSE 'Otros'
        END,
            ENT_TIPO_ID,
            PROD_DWH_CONSULTA_SA.AnonimizaData(ENT_IDENT) AS ENT_IDENT,
            PROD_DWH_CONSULTA_SA.AnonimizaData(ENT_NOMBRE) AS ENT_NOMBRE,
            ENT_FECHA_ACT,
            ENT_FECHA_DESDE,
            ENT_FECHA_HASTA,
            ENT_ESTADO,
            ENT_VIGENTE,
            ENT_DELEGATURA,
            ENT_CALIFICA,
            ENT_CRITERIO_GRUPO,
            ENT_AREA_ID,
            ENT_AREA_NOMBRE,
            ENT_EMISOR,
            ENT_NOMBRE_ESTADO,
            ENT_VIGILADA,
            ENT_CODIGOCIIU,
            ENT_DOMICILIO
        FROM PROD_DWH_DATA.ENTIDADES;