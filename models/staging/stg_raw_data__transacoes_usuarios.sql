{{
    config(
        materialized = 'view'
    )
}}

SELECT
    "codigo da transacao"           AS codigo_transacao,
    "data e hora da transacao"      AS date_transacao,
    "metodo de captura"             AS dispositivo_captura,
    LOWER("bandeira do cartao")     AS bandeira_cartao,
    "metodo de pagamento"           AS metodo_pagamento,
    LOWER("estado da transacao")    AS estado_transacao,
    "valor da transacao"            AS vl_transacao,
    "codigo do usuario"             AS codigo_usuario,
    LOWER("estado do usuario")      AS estado_usuario,
    "cidade do usuario"             AS cidade_usuario
FROM {{ source('raw_data','transacoes_usuarios') }}