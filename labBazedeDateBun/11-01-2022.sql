INSERT INTO universitate.persoana (cnp, seria, nr,prenume,nume,adresa,nationalitate) 
VALUES ('1002', '3', '13','Albu','Carla','aleea parc','roman');
SELECT denumire FROM universitate.materie where id_specializare=1 and an_de_studiu=3;
select nr_matricol from student where student.id_specializare in(
select id_specializare from specializare where specializare.id_facultate in(select id_facultate from facultate where decan="Volovici" ));

select  max(student.bursa),concat(persoana.nume," ",persoana.prenume) from student
join universitate.persoana
on student.cnp=persoana.cnp
where student.bursa=100
group by nume;

update student
set bursa=bursa + 0.1*bursa 
;
-- where an_curent=2021 and nota.nota>5;
select materie.profesor from materie where materie.id_materie in(select id_curs from nota where data_examen like % %)
;
