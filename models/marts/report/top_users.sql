with
    user_activity as (
        select *
        from {{ ref('user_activity') }}
    )

    , filtering_and_count as (
        select
            actors_id
            , actors_username
            , count(events_id) as top_users
        from user_activity
        where is_pullrequest is True or is_commit is True
        group by
            actors_id
            , actors_username
    )

    , limiting_and_ordering as (
        select *
        from filtering_and_count
        order by top_users desc
        limit 10
    )

select *
from limiting_and_ordering