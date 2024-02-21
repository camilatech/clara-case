with
    events as (
        select *
        from {{ source('bronze', 'events') }}
    )

    , casting_and_renaming as (
        select
            cast(id as string) as events_id
            , cast(type as string) as events_type
            , cast(actor_id as string) as actors_id
            , cast(repo_id as string) as repos_id
        from events
    )

    , flag_creation as (
        select
            *
            , events_type = 'PullRequestEvent' as is_pullrequest
            , events_type = 'CommitCommentEvent' as is_commit
            , events_type = 'WatchEvent' as is_watch 
        from casting_and_renaming
    )

select *
from flag_creation