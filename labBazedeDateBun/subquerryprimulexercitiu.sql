SELECT id_specializare,denumire 
FROM universitate.specializare
where id_facultate in(select id_facultate from facultate where an_fondare>1920);