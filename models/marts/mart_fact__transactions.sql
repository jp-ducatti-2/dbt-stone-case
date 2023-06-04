{{
    config(
        materialized='table'
    )
}}

SELECT  
    codigo_transacao,
    codigo_usuario,
    date_transacao,
    dispositivo_captura,
    bandeira_cartao,
    metodo_pagamento,
    estado_transacao,
    vl_transacao
FROM 
    {{ ref('int_users__transactions') }}