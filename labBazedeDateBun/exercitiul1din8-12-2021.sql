-- incercarea mea

select concat(nume," ",prenume) as numele_student,profesor
 from persoana,materie where concat(nume," ",prenume)= materie.profesor or concat(prenume," ",nume)= materie.profesor;
 
-- exercitiu 1 de la 8 facut in lab

select concat(persoana.nume," ",persoana.prenume) as nume_complet1,
 concat(persoana.prenume," ",persoana.nume) as nume_complet2,
materie.profesor from persoana
join student 
on persoana.cnp=student.cnp
cross join materie
-- where nume_complet1=materie.profesor OR nume_complet2=materie.profesor;
where concat(persoana.nume," ",persoana.prenume)=materie.profesor OR concat(persoana.prenume," ",persoana.nume)=materie.profesor;
-- continuare 1
-- corecta:
select profesor,substring_index(profesor," ",1) as nume,
 substring_index(profesor," ",-1) as prenume,
 concat_ws(' ',substring_index(profesor," ",-1),substring_index(profesor," ",1))as nume_nou from materie;

-- problema 2
select * from nota;