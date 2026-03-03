WITH raw_listings AS (
    SELECT
        *
    FROM
        {{ source('airbnb', 'listings')}}    -- jinja tag (references the raw table from the sources.yml file)
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings