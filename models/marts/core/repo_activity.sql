with
    stg_events as (
        select *
        from {{ ref('stg_events') }}
    )

    , stg_commits as (
        select *
        from {{ ref('stg_commits') }}
    )

    , stg_repos as (
        select *
        from {{ ref('stg_repos') }}
    )

    /* repo data is duplicated in the bronze, so this CTE bellow is used
    to dedup it */
    , deduping_repo as (
        select
            repos_id
            , repos_name
            , row_number () over (
                partition by 
                    repos_id
                /* As you can see, I did not dedup by the id + name. This is intentionally.
                We have a data problem we that the id = 230999134 has three names.
                In these cases, I usually that the most updated case or leave both if the business area
                demands an specific history. As we do not have it, I decided to use only the repo_id
                in the partition by. The same thing happens in stg_actors */
                order by repos_id
            ) as rn
        from stg_repos
    )

    , join_commits_events as (
        select
            deduping_repo.repos_id
            , deduping_repo.repos_name
            , stg_events.events_id
            , stg_events.events_type
            , stg_events.is_pullrequest
            , stg_events.is_commit
            , stg_events.is_watch
            , stg_commits.commits_message
            , stg_commits.commits_sh_key
        from deduping_repo
        left join stg_events
        on deduping_repo.repos_id = stg_events.repos_id
        left join stg_commits
        on stg_events.events_id = stg_commits.events_id
        where deduping_repo.rn = 1
    )

select *
from join_commits_events