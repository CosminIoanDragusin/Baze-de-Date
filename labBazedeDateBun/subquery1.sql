-- 1.	Listează ID-ul și denumirea specializărilor care aparțin facultăților fondate înainte de anul 1920.

SELECT id_specializare,denumire FROM specializare where id_facultate in (select id_facultate from facultate where an_fondare < 1957);