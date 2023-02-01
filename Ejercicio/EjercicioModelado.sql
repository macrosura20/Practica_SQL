--Modelo noramlizado nuevo.

create schema KCcoches authorization qyzqjzti;

---1. Coches y sus tablas de referencia

--Nombre de Aseguradora
create table KCcoches.aseguradoras(
	IdAseguradora varchar(20) not null, --pk
	nombre varchar(200) not null,
	descripcion varchar(512) null
);

alter table KCcoches.aseguradoras
add constraint aseguradoras_PK primary key (IdAseguradora);

--Nombre Grupo Empresarial de la Marca
create table KCcoches.gruposCoches(
	IdGrupoCoche varchar(20) not null, --pk
	nombre varchar(200) not null,
	descripcion varchar(512) null
);

alter table KCcoches.gruposCoches
add constraint gruposCoches_PK primary key (IdGrupoCoche);

--Nombre Marcas de Coche
create table KCcoches.marcas(
	IdMarca varchar(20) not null, --pk
	nombre varchar(200) not null,
	descripcion varchar(512) null,
	IdGrupoCoche varchar(20) not null --fk
);

alter table KCcoches.marcas
add constraint marcas_PK primary key (IdMarca);

alter table KCcoches.marcas
add constraint marca_grupoCoches_FK foreign key (IdGrupoCoche)
references KCcoches.gruposCoches(IdGrupoCoche);

--Modelos de Coche
create table KCcoches.modelos(
	IdModelo varchar(20) not null, --pk
	nombre varchar(200) not null,
	descripcion varchar(512) null,
	IdMarca varchar(20) not null --fk
);

alter table KCcoches.modelos
add constraint modelo_PK primary key (IdModelo);

alter table KCcoches.modelos
add constraint modelo_marcas_FK foreign key (IdMarca)
references KCcoches.marcas(IdMarca);

--Nombre de Colores
create table KCcoches.colores(
	IdColor varchar(20) not null, --pk
	nombre varchar(200) not null,
	descripcion varchar(512) null
);

alter table KCcoches.colores
add constraint colores_PK primary key (IdColor);

--Tipo de Estado
create table KCcoches.estados(
	IdEstado varchar(20) not null, --pk
	nombre varchar(200) not null,
	descripcion varchar(512) null
);

alter table KCcoches.estados
add constraint estados_PK primary key (IdEstado);

--Tipo de Monedas
create table KCcoches.monedas(
	IdMoneda varchar(20) not null, --PK
	nombre varchar(200) not null,
	descripcion varchar(512) null
);

alter table KCcoches.monedas
add constraint monedas_PK primary key (IdMoneda);

--Modelo de Coches
create table KCcoches.coches(
	IdCoche varchar(10) not null,  --PK
	fecha_compra date not null,
	precio_compra numeric(12,5) not null,
	IdMoneda varchar(20) not null, --FK
	matricula varchar(7) not null,
	IdModelo varchar(20) not null, --FK
	IdColor varchar(20) not null, --FK
	IdAseguradora varchar(20) not null, --FK
	num_poliza varchar(20) not null,
	km_recorridos numeric(8) not null,
	IdEstado varchar(20) not null --FK
);
	
alter table KCcoches.coches
add constraint coches_PK primary key (IdCoche);

alter table KCcoches.coches
add constraint coche_modelos_FK foreign key (IdModelo)
references KCcoches.modelos(IdModelo);	
	
alter table KCcoches.coches
add constraint coche_colores_FK foreign key (IdColor)
references KCcoches.colores(IdColor);	

alter table KCcoches.coches
add constraint coche_Aseguradoras_FK foreign key (IdAseguradora)
references KCcoches.Aseguradoras(IdAseguradora);

alter table KCcoches.coches
add constraint coche_estados_FK foreign key (IdEstado)
references KCcoches.estados(IdEstado);	

alter table KCcoches.coches
add constraint coches_monedas_FK foreign key (IdMoneda)
references KCcoches.monedas(IdMoneda);	
	
-- Registro de Revisiones
create table KCcoches.revisiones(
	IdRevision varchar(20) not null, --PK
	IdCoche varchar(10) not null, --PK,FK
	fecha_revision date not null,
	km numeric(8) not null,
	importe numeric(12,5) not null,
	IdMoneda varchar(20) not null -- FK
);

alter table KCcoches.revisiones
add constraint revisiones_PK primary key (IdCoche,IdRevision);

alter table KCcoches.revisiones
add constraint revisiones_coches_FK foreign key (IdCoche)
references KCcoches.coches(IdCoche);	

alter table KCcoches.revisiones
add constraint revisiones_monedas_FK foreign key (IdMoneda)
references KCcoches.monedas(IdMoneda);	


--- Cargar datos
--- Aseguradoras
insert into KCcoches.aseguradoras 
(IdAseguradora, nombre , descripcion)
values('AXA', 'Grupo Axa', '');

insert into KCcoches.aseguradoras
(IdAseguradora, nombre , descripcion)
values('PELAYO', 'Grupo Pelayo', '');

insert into KCcoches.aseguradoras
(IdAseguradora, nombre , descripcion)
values('MAPFRE', 'Mapfre', '');

insert into KCcoches.aseguradoras
(IdAseguradora, nombre , descripcion)
values('ALLIANZ', 'Allianz Direct', '');

---Grupo de Coches
insert into KCcoches.gruposcoches  
(IdGrupoCoche, nombre , descripcion)
values('RNM', 'Alianza Renault-Nissan-Mitsubishi', '');

insert into KCcoches.gruposcoches  
(IdGrupoCoche, nombre , descripcion)
values('TMC', 'Toyota Motor Corporation', '');

insert into KCcoches.gruposcoches  
(IdGrupoCoche, nombre , descripcion)
values('GM', 'General Motors', '');

---Marcas
insert into KCcoches.marcas 
(IdMarca, nombre, IdGrupoCoche)
values('RENAULT', 'Renault', 'RNM');

insert into KCcoches.marcas 
(IdMarca, nombre, IdGrupoCoche)
values('NISSAN', 'Nissan', 'RNM');

insert into KCcoches.marcas 
(IdMarca, nombre, IdGrupoCoche)
values('TOYOTA', 'Toyota', 'TMC');

insert into KCcoches.marcas 
(IdMarca, nombre, IdGrupoCoche)
values('CHEVROLET', 'Chevrolet', 'GM');

---Modelos
insert into KCcoches.modelos  
(IdModelo, nombre, IdMarca)
values('YARIS', 'Toyota Yaris', 'TOYOTA'); ---18.400,00

insert into KCcoches.modelos 
(IdModelo, nombre, IdMarca)
values('COROLLA', 'Toyota Corolla', 'TOYOTA'); ---24.350,00

insert into KCcoches.modelos 
(IdModelo, nombre, IdMarca)
values('CLIO', 'RENAULT CLIO E-TECH FULL HYBRID', 'RENAULT'); ---21.900,00

insert into KCcoches.modelos 
(IdModelo, nombre, IdMarca)
values('CAPTUR', 'RENAULT CAPTUR E-TECH FULL HYBRID', 'RENAULT');---26.400,00

insert into KCcoches.modelos 
(IdModelo, nombre, IdMarca)
values('JUKE', 'NISSAN JUKE', 'NISSAN'); ---16.435,00

---Colores
insert into KCcoches.colores
(IdColor, nombre , descripcion)
values('BLANCO', 'Blanco', '');

insert into KCcoches.colores
(IdColor, nombre , descripcion)
values('NEGRO', 'Negro', '');

insert into KCcoches.colores
(IdColor, nombre , descripcion)
values('ROJO', 'Rojo', '');

insert into KCcoches.colores
(IdColor, nombre , descripcion)
values('PLATA', 'Plateado', '');

insert into KCcoches.colores
(IdColor, nombre , descripcion)
values('AMARILLO', 'Amarillo', '');

---Estado
insert into KCcoches.estados
(IdEstado, nombre , descripcion)
values('ACTIVO', 'Activo', '');

insert into KCcoches.estados
(IdEstado, nombre , descripcion)
values('INACTIVO', 'Inactivo', '');

insert into KCcoches.estados
(IdEstado, nombre , descripcion)
values('MANT', 'Mantenimiento', 'El vehiculo se encuentra en taller por mantenimiento');

---Monedas
insert into KCcoches.monedas
(IdMoneda, nombre , descripcion)
values('EURO', 'EURO', '');

insert into KCcoches.monedas
(IdMoneda, nombre , descripcion)
values('DOLLARS_USA', 'Dolar Americano', '');

----Coches
insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0001','2018-04-12','18400','EURO','3654TPV','YARIS','ROJO','MAPFRE','W123FR567','50000', 'ACTIVO');

insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0002','2019-08-05','21900','EURO','5867HGF','CLIO','NEGRO','PELAYO','T123UR567','20000', 'ACTIVO');

insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0003','2015-10-02','26000','EURO','8544POI','CAPTUR','BLANCO','MAPFRE','P987FR567','150000', 'ACTIVO');

insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0004','2017-02-22','20000','EURO','9376TRE','CLIO','NEGRO','AXA','T123UR567','200000', 'INACTIVO');

insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0005','2019-03-15','25350','EURO','8745BVC','CAPTUR','AMARILLO','MAPFRE','W65289GG62','60000', 'ACTIVO');

insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0006','2019-08-05','21900','EURO','5867HGF','JUKE','PLATA','ALLIANZ','T123UR567','20000', 'MANT');

insert into KCcoches.coches --DOLLARS
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0007','2012-07-26','23000','DOLLARS_USA','8901GHT','CAPTUR','BLANCO','MAPFRE','I27635T123','65000', 'ACTIVO');

insert into KCcoches.coches
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0008','2019-02-22','20000','EURO','0234KSM','JUKE','PLATA','AXA','L123B2314','150000', 'INACTIVO');

insert into KCcoches.coches --DOLLARS
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0009','2013-11-26','22000','DOLLARS_USA','2245JUJ','CAPTUR','NEGRO','MAPFRE','W12312G4123','250000', 'ACTIVO');

insert into KCcoches.coches 
(IdCoche, fecha_compra, precio_compra, IdMoneda, matricula, IdModelo, IdColor, IdAseguradora, num_poliza, km_recorridos, IdEstado)
values('C0010','2016-01-16','23000','EURO','7487DDF','JUKE','PLATA','PELAYO','X23123X123','45000', 'INACTIVO');
----
---Revisiones
insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0001','C0001','2018-04-15','1000', '350', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0002','C0007','2012-08-26','500', '150', 'DOLLARS_USA');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0003','C0009','2013-12-16','300', '250', 'DOLLARS_USA');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R004','C0003','2015-11-04','200', '250', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0005','C0010','2017-04-15','2000', '450', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0006','C0001','2020-06-15','35000', '650', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0007','C0004','2017-08-22','1500', '450', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0008','C0008','2019-04-13','6000', '570', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0009','C0005','2019-12-03','12000', '450', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0010','C0006','2020-01-15','700', '630', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0011','C0002','2020-02-20','8200', '1200', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0012','C0004','2019-05-30','75000', '1150', 'EURO');

insert into kccoches.revisiones
(IdRevision, IdCoche, fecha_revision, km, importe, IdMoneda)
values('R0013','C0001','2021-04-26','30000', '275', 'EURO');
