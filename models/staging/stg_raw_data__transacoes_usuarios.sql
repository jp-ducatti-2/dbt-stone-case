{{
    config(
        materialized = 'view'
    )
}}

WITH 

dedup as (
    SELECT
        CAST("codigo da transacao" AS text)             AS codigo_transacao,
        "data e hora da transacao"                      AS date_transacao,
        "metodo de captura"                             AS dispositivo_captura,
        LOWER("bandeira do cartao")                     AS bandeira_cartao,
        "metodo de pagamento"                           AS metodo_pagamento,
        LOWER("estado da transacao")                    AS estado_transacao,
        "valor da transacao"                            AS vl_transacao,
        CAST("codigo do usuario" AS text)               AS codigo_usuario,
        LOWER("estado do usuario")                      AS estado_usuario,
        "cidade do usuario"                             AS cidade_usuario,
        ROW_NUMBER () OVER (PARTITION BY codigo_transacao ORDER BY date_transacao ASC) AS rn
    FROM 
        {{ source('raw_data','transacoes_usuarios') }}
)

SELECT 
    *
FROM 
    dedup
WHERE 
    rn = 1