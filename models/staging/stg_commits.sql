with
    commits as (
        select *
        from {{ source('bronze', 'commits') }}
    )

    , casting_and_renaming as (
        select
            cast(event_id as string) as events_id
            , cast(message as string) as commits_message
            , cast(sha as string) as commits_hash
        from commits
    )

select *
from casting_and_renaming