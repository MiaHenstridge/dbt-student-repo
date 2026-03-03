-- config to specify that this is an incremental load
{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
-- core query
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}    -- ref tag to this table
)
SELECT * FROM src_reviews
WHERE review_text is not null
-- incremental load (only new records)
{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})   -- ref tag to this sql?
{% endif %}