select * from kccoches.coches c where idestado = 'ACTIVO'

--Consulta SQL
select m.nombre as Modelo, m2.nombre as Marca, 
g.nombre as Grupo_de_coches, c.fecha_compra, c.matricula, c2.nombre as Color,
c.km_recorridos, a.nombre as Aseguradora, c.num_poliza
from kccoches.coches c  inner join kccoches.modelos m 
on c.idmodelo = m.idmodelo 
inner join kccoches.marcas m2 
on m2.idmarca  = m.idmarca
inner join kccoches.gruposcoches g 
on g.idgrupocoche = m2.idgrupocoche
inner join kccoches.aseguradoras a 
on a.idaseguradora = c.idaseguradora
inner join kccoches.colores c2
on c2.idcolor = c.idcolor
where c.idestado = 'ACTIVO';
 