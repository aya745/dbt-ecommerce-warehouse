select
    customer_id,
    first_name,
    last_name,
    email,
    cast(signup_date as date) as signup_date,
    country
from {{ ref('customers') }}