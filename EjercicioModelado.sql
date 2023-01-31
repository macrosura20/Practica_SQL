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

--Modelo de Coches
create table KCcoches.coches(
	IdCoche varchar(10) not null,  --PK
	fecha_compra date not null,
	matricula varchar(7) not null,
	IdModelo varchar(20) not null, --FK
	IdColor varchar(20) not null, --FK
	IdAseguradora varchar(20) not null, --FK
	num_poliza varchar(10) not null,
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
	
--Tipo de Monedas
create table KCcoches.monedas(
	IdMoneda varchar(20) not null, --PK
	nombre varchar(200) not null,
	descripcion varchar(512) null
);

alter table KCcoches.monedas
add constraint monedas_PK primary key (IdMoneda);


-- Registro de Revisiones
create table KCcoches.revisiones(
	IdRevision varchar(20) not null, --PK
	IdCoche varchar(10) not null, --PK,FK
	fecha_revision date not null,
	km numeric(8) not null,
	importe numeric(8,5) not null,
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

