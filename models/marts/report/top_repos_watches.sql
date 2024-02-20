with
    repo_activity as (
        select *
        from {{ ref('repo_activity') }}
    )

    , filtering_and_count as (
        select
            repos_id
            , repos_name
            , count(events_id) as top_repo_watches
        from repo_activity
        where is_watch is True
        group by
            repos_id
            , repos_name
    )

    , limiting_and_ordering as (
        select *
        from filtering_and_count
        order by top_repo_watches desc
        limit 10
    )

select *
from limiting_and_ordering