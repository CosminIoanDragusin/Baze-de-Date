SELECT data_examen,curdate(),datediff(curdate(),data_examen) as numarul_zile FROM universitate.nota;
