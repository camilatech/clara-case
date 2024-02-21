with
    stg_events as (
        select *
        from {{ ref('stg_events') }}
    )

    , stg_commits as (
        select *
        from {{ ref('stg_commits') }}
    )

    , stg_actors as (
        select *
        from {{ ref('stg_actors') }}
    )

    /* actor data is duplicated in the bronze, so this CTE bellow is used
    to dedup it */
    , deduping_actor as (
        select
            actors_id
            , actors_username
            , row_number () over (
                /* As you can see, I did not dedup by the id + username. This is intentionally.
                We have a data problem we that the id = 59176384 has two usernames.
                In these cases, I usually that the most updated case or leave both if the business area
                demands an specific history. As we do not have it, I decided to use only the actors_id
                in the partition by. The same thing happens in stg_repo */
                partition by 
                    actors_id
                order by actors_id
            ) as rn
        from stg_actors
    )

    , join_commits_events as (
        select
            deduping_actor.actors_id
            , deduping_actor.actors_username
            , stg_events.events_id
            , stg_events.events_type
            , stg_events.is_pullrequest
            , stg_events.is_commit
            , stg_events.is_watch
            , stg_commits.commits_message
            , stg_commits.commits_sh_key
        from deduping_actor
        left join stg_events
        on deduping_actor.actors_id = stg_events.actors_id
        left join stg_commits
        on stg_events.events_id = stg_commits.events_id
        where deduping_actor.rn = 1
    )

select *
from join_commits_events