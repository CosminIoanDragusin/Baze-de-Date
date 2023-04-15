SELECT id_facultate,denumire FROM universitate.facultate
union all
select id_specializare,denumire from specializare order by denumire desc ;