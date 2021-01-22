-- a)	Obtén el total de contactos por ciudad
SELECT ciu.nombre, count(con.contacto_id)
FROM ciudad ciu, contacto con WHERE ciu.ciudad_id = con.ciudad_id
GROUP BY ciu.nombre

-- b)	Obtén los primeros 25 contactos de país México
SELECT *
FROM contacto con, pais pa WHERE  pa.nombre= 'MEXICO'
limit 25

-- c)	Obtén los últimos 50 contactos 
SELECT *
FROM contacto con, pais pa WHERE  pa.nombre= 'MEXICO'
OFFSET 50	

-- d)	Obtén todos los contactos con todos sus datos personales agrupados de por estado y ordenados por apellido alfabéticamente *Escrita mal
SELECT con.nombre, con.sexo, con.rfc, con.domicilio, con.fecha_nacimiento, es.nombre
FROM contacto con, ciudad ciu, estado es 
where ciu.estado_id = es.estado_id and ciu.ciudad_id = con.contacto_id
ORDER BY(con.nombre) ASC	

-- e)Obtén los contactos cuya edad este entre 17 y 22 años, se encuentren en los municipios: 
-- Zapopan, Guadalajara, Tonalá y Tlaquepaque
SELECT con.nombre, con.sexo, con.rfc, con.domicilio, con.fecha_nacimiento, ciu.nombre
FROM contacto con, ciudad ciu
where ciu.ciudad_id = con.contacto_id 
AND con.fecha_nacimiento BETWEEN '1998/01/01' AND '2003/12/31'
AND ciu.nombre = 'Zapopan' or ciu.nombre = 'Guadalajara' or ciu.nombre = 'Tonala' or ciu.nombre = 'Tlaquepaque'

-- f)	Obtén la cantidad de contactos por estado donde su numero telefónico contenga 3313 en cualquier posición
SELECT count(con.contacto_id), es.nombre
FROM estado es, ciudad ciu, contacto con,telefonos tel 
WHERE con.ciudad_id = ciu.ciudad_id and ciu.estado_id = es.estado_id
AND con.telefonos_id = tel.telefonos_id
AND tel.email like '%3313%' 
GROUP BY (es.nombre)
