{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'delete+insert',
        unique_key = 'codigo_transacao'
    )
}}

    SELECT
        codigo_transacao,
        date_transacao,
        dispositivo_captura,
        bandeira_cartao,
        metodo_pagamento,
        estado_transacao,
        vl_transacao,
        codigo_usuario,
        estado_usuario,
        cidade_usuario
    FROM 
        {{ ref('stg_raw_data__transacoes_usuarios') }}
    WHERE 
        LOWER(estado_transacao) IN ('paid','refused','refunded','chargedback')
