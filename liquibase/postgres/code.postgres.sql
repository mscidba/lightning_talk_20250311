-- liquibase formatted sql

-- changeset jeff.pell:code-0001  endDelimiter=/ runOnChange=true stripComments:False
CREATE OR REPLACE FUNCTION public.find_state_path(
    p_start_state varchar(50),
    p_end_state varchar(50))
returns table (  state_name varchar(50), state_name_bordering varchar(50), path varchar(50)[], level int)
LANGUAGE plpgsql as
'
BEGIN
return query
with recursive translation (state_name, state_name_bordering, path, level)
as
(
    select
        sb.state_name,
        sb.state_name_bordering,
        array[sb.state_name::varchar, sb.state_name_bordering::varchar],
        1 as level
    from state_border sb
    where sb.state_name = p_start_state
union all
    select
        s.state_name,
        s.state_name_bordering,
        array_cat( t.path , array[s.state_name_bordering::varchar]),
        t.level + 1  as level
    from state_border as s
    join translation as t
    on t.state_name_bordering = s.state_name
    and s.state_name_bordering <> all(t.path)
)
select *
from translation
where translation.state_name_bordering = p_end_state
limit 10
;

END;
'
/


