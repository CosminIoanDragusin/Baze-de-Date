update nota 
SET data_examen="22-03-21"
where id_curs in(select id_materie from universitate.materie where an_studiu="1");