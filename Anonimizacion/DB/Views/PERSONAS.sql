REPLACE VIEW PROD_DWH_CONSULTA_SA.PERSONAS
    (	
    Ent_id,
    Fecha_Corte,
    Tipo_Informe,
    Tipo_Identificacion,
    Numero_Identificacion,
    Pau_Id,
    Codigo_Ciiu,
    Codigo_Cidt,
    Razon_Social,
    Codigo_Naturaleza_Juridica,
    CIIUCON,
    NATJURCON,
    ECIND1,
    ECIND2,
    ECIND3
    )
    AS 
    LOCKING ROW FOR ACCESS
    SELECT 
        PER_ENT_ID,
        PER_FECCORTE,
        PER_TIPINF,
        PER_TIPIDE,
        PROD_DWH_CONSULTA_SA.AnonimizaData(PER_NUMIDE) AS PER_NUMIDE,
        PER_PAU_ID,
        PER_CODCIIU,
        PER_CODCIDT,
        PROD_DWH_CONSULTA_SA.AnonimizaData(PER_RAZSOC) AS PER_RAZSOC,
        PER_CODNATJUR,
        PER_CIIUCON,
        PER_NATJURCON,
        PER_ECIND1,
        PER_ECIND2,
        PER_ECIND3
        FROM PROD_DWH_DATA.PERSONAS;