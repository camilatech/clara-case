with
    events as (
        select *
        from {{ source('bronze', 'events') }}
    )

    , casting_and_renaming as (
        select
            cast(id as string) as id
            , cast(type as string) as type
            , cast(actor_id as string) as actors_id
            , cast(repo_id as string) as repos_id
        from events
    )

select *
from casting_and_renaming