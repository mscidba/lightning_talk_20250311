with recursive translation (state_name, state_name_bordering, path, level)
as
(
    select
        state_name,
        state_name_bordering,
        array[state_name::varchar, state_name_bordering::varchar],
        1 as level
    from state_border
    where state_name = 'StartStateNameHere'
union all
    select
        s.state_name,
        s.state_name_bordering,
        array_cat( path , array[s.state_name_bordering::varchar]),
        level + 1  as level
    from state_border as s
    join translation as t
    on t.state_name_bordering = s.state_name
    and s.state_name_bordering <> all(t.path)
)
select *
from translation
where state_name_bordering = 'EndStateNameHere'
;
