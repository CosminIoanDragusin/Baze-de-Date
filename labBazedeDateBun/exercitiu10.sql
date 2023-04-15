SELECT specializare.denumire  as Specializare,
       facultate.denumire as facultate
       from specializare
       join facultate
       on facultate.id_facultate=specializare.id_facultate