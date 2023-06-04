{{
    config(
        materialized='table'
    )
}}

SELECT DISTINCT
    codigo_usuario,
    FIRST_VALUE(estado_usuario) OVER (PARTITION BY codigo_usuario
                                     ORDER BY date_transacao ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS estado_usuario,
    FIRST_VALUE(cidade_usuario) OVER (PARTITION BY codigo_usuario
                                     ORDER BY date_transacao ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS cidade_usuario                                 
FROM
    {{ ref('int_users__transactions') }}  