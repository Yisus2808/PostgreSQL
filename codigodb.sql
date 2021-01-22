CREATE TABLE pais(
    pais_id integer primary key not null,
    codigo character varying(8) not null,
    nombre character varying(60) not null
);

CREATE TABLE tipo_dato_personal(
    tipo_dato_personal_id integer primary key not null,
    descripcion character varying(30) not null
);

CREATE TABLE estado(
    estado_id integer primary key not null,
    codigo character varying(8) not null,
    nombre character varying(30) not null,
    pais_id integer not null,
    CONSTRAINT fk_pais FOREIGN KEY (pais_id) REFERENCES public.pais(pais_id)
);

create table ciudad(
    ciudad_id integer primary key not null,
    codigo character varying(8) not null,
    nombre character varying(30) not null,
    estado_id integer not null,
    CONSTRAINT fk_estado FOREIGN KEY(estado_id) REFERENCES public.estado(estado_id)
);

create table telefonos(
    telefonos_id integer primary key not null,
    email character varying(60) not null,
    tipo_dato_personal_id integer not null,
    CONSTRAINT fk_tipo FOREIGN KEY(tipo_dato_personal_id) REFERENCES public.tipo_dato_personal(tipo_dato_personal_id)
);

create table emails(
    emails_id integer primary key not null,
    email character varying(60) not null,
    tipo_dato_personal_id integer not null,
    CONSTRAINT fk_tipo_dato_personal FOREIGN KEY (tipo_dato_personal_id) REFERENCES public.tipo_dato_personal(tipo_dato_personal_id)
);	

create table contacto(
    contacto_id integer primary key not null,
    nombre character varying(30) not null,
    sexo character varying(4) not null,
    RFC character varying(60) not null,
    fecha_nacimiento date not null,
    telefonos_id integer not null,
    emails_id integer not null,
    domicilio character varying(80) not null,
    ciudad_id integer not null,
    CONSTRAINT fk_telefonos FOREIGN KEY (telefonos_id) REFERENCES public.telefonos(telefonos_id),
    CONSTRAINT fk_emails FOREIGN KEY (emails_id) REFERENCES public.emails(emails_id),
    CONSTRAINT fk_ciudad FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(ciudad_id)
);

insert into pais(pais_id, codigo, nombre) values (1,'MXN','MEXICO'),
(2, 'EUA', 'ESTADOS UNIDOS DE AMERICA'),
(3, 'ARG', 'ARGENTINA'),
(4, 'COL', 'COLOMBIA'),
(5, 'ESP', 'ESPAÑA');

-- id	CODIGO	NOMBRE
-- 1	MXN	Mexico
-- 2	EUA	ESTADOS UNIDOS DE AMERICA
-- 3	ARG	ARGENTINA
-- 4	COL	COLOMBIA
-- 5	ESP	ESPAÑA

insert into tipo_dato_personal(tipo_dato_personal_id, descripcion) values (1, 'Personal'),
(2, 'Escuela'),
(3, 'Trabajo'),
(4, 'Fiscal'),
(5, 'Entregas'),
(6, 'Envios');

-- id	Descripción
-- 1	Personal
-- 2	Escuela
-- 3	Trabajo
-- 4	Fiscal
-- 5	Entregas
-- 6	Envios

insert into estado(estado_id, codigo, nombre, pais_id) values(1, 'JAL', 'Jalisco', 1),
(2, 'CDMX', 'Ciudad de Mexico', 1),
(3, 'NL', 'Nuevo Leon', 1),
(4, 'DRG', 'Durango', 1),
(5, 'SNR', 'Sonora', 1),
(6, 'CLF', 'California', 2);

-- id	CODIGO	NOMBRE	Pais
-- 1	JAL	Jalisco	1
-- 2	CDMX	CIUDAD DE MEXICO	1
-- 3	NL	Nuevo León	1
-- 4	DRG	Durango	1
-- 5	SNR	Sonora	1
-- 6	CLF	California	2

insert into ciudad(ciudad_id, codigo, nombre, estado_id) values(1,'zpn01', 'Zapopan', 1),
(2,'gdl01', 'GUADALAJARA', 1),
(3,'tlj01', 'Tlajomulco', 1),
(4,'tlq01', 'Tlaquepaque', 1),
(5,'tnl01', 'Tonala', 1),
(6,'ncl01', 'Naucalpan', 2),
(7,'xch01', 'Xochimilco', 2),
(8,'mnt01', 'Monterrey', 3),
(9,'drn01', 'Durango', 4),
(10,'anh01', 'Anahein',6);

-- id	CODIGO	NOMBRE	Estado
-- 1	zpn01	ZAPOPAN	1
-- 2	gdl01	GUADALAJARA	1
-- 3	tlj01	Tlajomulco	1
-- 4	tlq01	Tlaquepaque	1
-- 5	tnl01	Tonala	1
-- 6	ncl01	Naucalpan	2
-- 7	xch01	Xochimilco	2
-- 8	mnt01	Monterrey	3
-- 9	drn01	Durango	4
-- 10	anh01	Anahein	6

insert into telefonos(telefonos_id, email, tipo_dato_personal_id) values(1,'33182568',1),	
(2,'33187968',3),
(3,'33132568',4),
(4,'33182788',2),
(5,'33182512',4),
(6,'33192568',3),
(7,'33177968',3),
(8,'33155568',2),
(9,'33182558',4),
(10,'33222512',2),
(11,'33182522',1),
(12,'33347968',1),
(13,'33136768',4),
(14,'33187488',2),
(15,'33188812',3);

insert into emails(emails_id, email, tipo_dato_personal_id) values(1,'a@q.com',1),
(2,'b@d.com',2),
(3,'e@q.com',2),
(4,'i@d.com',1),
(5,'o@q.com',2),
(6,'u@d.com',3),
(7,'x@q.com',5),
(8,'y@d.com',4),
(9,'z@q.com',3),
(10,'g@d.com',1),
(11,'h@q.com',1),
(12,'j@d.com',4);

insert into contacto(contacto_id,nombre,sexo,RFC,fecha_nacimiento,telefonos_id,emails_id,domicilio,ciudad_id) values
(1,'Pedro','M','Pedxx1P304375','01/05/1983',14,4,'COL. EX-NORMAL TUXTEPEC',1),
(2,'Luis','M','Luixx1P365014','07/12/1999',1,12,'AV. INDEPENDENCIA NO. 241',1),
(3,'Rodolfo','M','Rodxx1P326587','30/05/1989',11,1,'AV. INDEPENDENCIA NO. 779',2),
(4,'Maria','F','Marxx1P366775','31/05/2000',2,5,'AV. 20 DE NOVIEMBRE NO.1024',1),
(5,'Jose','M','Josxx1P305024','05/07/1983',3,4,'CARRETERA A LOMA ALTA S/N.',2),
(6,'Antonio','M','Antxx1P195127','02/06/1953',1,12,'AV. 20 DE NOVIEMBRE NO. 1060',3),
(7,'Laura','F','Lauxx1P318815','14/04/1987',4,1,'CALLE ZARAGOZA NO. 1010',4),
(8,'Miguel','M','Migxx1P359236','08/05/1998',15,5,'CALLE MATAMOROS NO. 310',5),
(9,'Catalina','F','Catxx1P368918','31/12/2000',1,12,'AV. 20 DE NOVIEMBRE NO.859-B',6),
(10,'Karina','F','Karxx1P305036','06/07/1983',5,9,'AV. 20 DE NOVIEMBRE NO 1053',1),
(11,'Lulu','F','Lulxx1P363834','11/08/1999',5,5,'BLVD. BENITO JUAREZ NO. 1466-A',2),
(12,'Lupe','F','Lupxx1P304484','12/05/1983',13,11,'CALLE MATAMOROS NO.280',3),
(13,'Josefa','F','Josxx1P319716','13/07/1987',9,8,'AV. INDEPENDENCIA NO. 545',4),
(14,'Joel','M','Joexx1P341884','07/08/1993',5,1,'AV. INDEPENDENCIA NO. 1282-A',5),
(15,'Romina','F','Romxx1P342816','08/11/1993',11,2,'CALLE MATAMOROS NO. 127',6),
(16,'Mateo','M','Matxx1P319075','10/05/1987',8,12,'AV.INDEPENDENCIA NO.1010',7),
(17,'Daniela','F','Danxx1P195727','01/08/1953',1,1,'AV. 5 DE MAYO NO. 1652',8),
(18,'Daniel','M','Danxx1P269456','08/10/1973',2,1,'AV. 5 DE MAYO NO. 1108',9),
(19,'Alvaro','M','Alvxx1P317946','17/01/1987',3,5,'AV. INDEPENDENCIA NO. 748',3),
(20,'Nidia','F','Nidxx1P393675','12/10/2007',4,4,'AV. INDEPENDENCIA NO. 985-A',4),
(21,'Andrian','M','Andxx1P357397','05/11/1997',12,12,'AV. INDEPENDENCIA NO. 985-A',5),
(22,'Adriana','F','Adrxx1P306567','06/12/1983',8,5,'BLVD. BENITO JUAREZ S / N',6),
(23,'Rosa','F','Rosxx1P326594','31/05/1989',14,4,'MATAMOROS NO 149',7),
(24,'Sandra','F','Sanxx1P357396','05/11/1997',15,12,'AV. 5 DE MAYO NO 1100-A',1),
(25,'Cintya','F','Cinxx1P306566','06/12/1983',1,1,'AV. 20 DE NOVIEMBRE NO 1540',2),
(26,'Mariana','F','Marxx1P326597','31/05/1989',1,5,'AV. 5 DE MAYO NO 1253',3),
(27,'Karen','F','Karxx1P359245','09/05/1998',5,8,'CALLE OCAMPO NO 14',4),
(28,'David','M','Davxx1P305935','04/10/1983',4,9,'BLVD. BENITO JUAREZ ESQ. 20 DE NOVIEMBRE S/N',5),
(29,'Sergio','M','Serxx1P252626','28/02/1969',15,10,'CALLE ALDAMA NO 156',6),
(30,'Marco','M','Marxx1P199315','26/07/1954',1,1,'AV. INDEPENDENCIA NO 145',7),
(31,'Manuel','M','Manxx1P146006','21/12/1939',5,12,'AV. 20 DE NOVIEMBRE NO 1046',8),
(32,'Alejandra','F','Alexx1P320319','11/09/1987',10,12,'CALLE IGNACIO RAYON NO.949',9),
(33,'Rocio','F','Rocxx1P354355','05/01/1997',1,6,'CALLE IGNACIO RAYON NO.934',5),
(34,'Irma','F','Irmxx1P303554','08/02/1983',2,7,'AV. 20 DE NOV. NO. 881 ESQ. ALDAMA',6),
(35,'Sofia','F','Sofxx1P326595','31/05/1989',3,1,'STR. VERONA   NO. 1178',10),
(36,'Francia','F','Fraxx1P247817','05/11/1967',4,8,'AV. 5 DE MAYO NO. 1226',8),
(37,'Irlanda','F','Irlxx1P306567','06/12/1983',15,1,'AV. INDEPENDENCIA S/N EXT. DEL MERCADO CENTRAL ESQ. BENITO JUAREZ',9),
(38,'Sasha','F','Sasxx1P290065','31/05/1979',1,9,'MATAMOROS NO 85 ESQ. 20 DE NOVIEMBRE',8),
(39,'Andrea','F','Andxx1P315416','09/05/1986',5,8,'AV. 20 DE NOVIEMBRE NO 1320',1),
(40,'Julia','F','Julxx1P364375','04/10/1999',3,7,'CALLE OCAMPO NO. 254',2),
(41,'Michel','F','Micxx1P252626','28/02/1969',6,5,'AV.INDEPENDENCIA NO. 678',3),
(42,'Silvia','F','Silxx1P362346','15/03/1999',2,1,'AV. INDEPENDENCIA N0.677',4),
(43,'Raquel','F','Raqxx1P317256','09/11/1986',3,5,'CALLE MORELOS NO. 72-B',5),
(44,'Sara','F','Sarxx1P364984','04/12/1999',9,5,'STR. OKLAA  NO.50',10),
(45,'Paula','F','Pauxx1P253215','28/04/1969',6,1,'CALLE IGNACIO MATIAS NO.6',5),
(46,'Elena','F','Elexx1P363565','15/07/1999',7,12,'AV. INDEPENDENCIA NO. 670',1),
(47,'Eva','F','Evaxx1P305933','04/10/1983',8,11,'AV. CLIBER  NO.786',10),
(48,'Lucia','F','Lucxx1P252625','28/02/1969',9,9,'AV. LIBERTAD NO. 495',3),
(49,'Javier','M','Javxx1P296466','01/03/1981',10,12,'AV. 5 NO. 1186 A',4),
(50,'Diego','M','Diexx1P146005','21/12/1939',5,10,'AV. 5 NO.1186-A',5),
(51,'Carlos','M','Carxx1P298816','22/10/1981',12,12,'AV. 20 DE NOVIEMBRE ESQ. JUAREZ',6),
(52,'Karla','F','Karxx1P354355','05/01/1997',10,7,'AV. INDEPENDENCIA N0.670',7),
(53,'Ari','F','Arixx1P303553','08/02/1983',4,8,'CALLE BENITO JUAREZ NO.495',8),
(54,'Ariana','F','Arixx1P372966','09/02/2002',15,1,'20 DE NOVIEMBRE NO. 955',9),
(55,'Arlet','F','Arlxx1P199315','26/07/1954',6,1,'AV. INDEPENDENCIA 918',4),
(56,'Xochilt','F','Xocxx1P199327','27/07/1954',7,6,'AV INDEPENDENCIA 565-A',5),
(57,'Victoria','F','Vicxx1P378758','11/09/2003',1,9,'CALLE MATAMOROS NO. 325',6),
(58,'Chantal','F','Chaxx1P326597','31/05/1989',2,2,'CALLE RIVA PALACIOS NO. 465',7),
(59,'Nuria','F','Nurxx1P385045','01/06/2005',3,1,'AV. 20 DE NOVIEMBRE NO. 1291',8),
(60,'Yanira','F','Yanxx1P318246','16/02/1987',4,5,'5 DE MAYO 1038',9),
(61,'Jessica','F','Jesxx1P247817','05/11/1967',15,12,'AV. INDEPENDENCIA NO. 1054',5);
