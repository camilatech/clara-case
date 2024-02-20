with
    actors as (
        select *
        from {{ source('bronze', 'actors') }}
    )

    , casting_and_renaming as (
        select
            cast(id as string) as id
            , cast(username as string) as actors_username
        from actors
    )

select *
from casting_and_renaming