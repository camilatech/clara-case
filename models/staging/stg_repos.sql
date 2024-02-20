with
    repos as (
        select *
        from {{ source('bronze', 'repos') }}
    )

    , casting as (
        select
            cast(id as string) as id
            , cast(name as string) as repos_name
        from repos
    )

select *
from casting