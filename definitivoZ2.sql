CREATE DATABASE CLUB6
GO
USE CLUB6
GO


CREATE TABLE JUGADOR(
idEquipo INT,
idNacionalidad INT,
idEstadoJugador INT,
idJugador INT identity(1,1) not null,
nomJugador varchar(50),
fechaNacJugador date,
pieHabil varchar(20),
dorsalJugador int,
posJugador varchar(20),
numGoles tinyint default 0,
numTarjetas tinyint default 0)

CREATE TABLE EQUIPO(
idEquipo INT identity(1,1) NOT NULL,
nomEquipo VARCHAR(20),
numJugadores INT,
fechaFundacion DATE,
nomEntrenador VARCHAR(20),
numPartidosGanados INT,
numPartidosEmpatados iNT default 0,
numPartidosPerdidos INT default 0,
difGoles INT
)

CREATE TABLE ESTADIO(
idEstadio INT IDENTITY(1,1) NOT NULL,
NomEstadio VARCHAR(20),
DireccionEstadio VARCHAR(20),
Capacidad VARCHAR(20),
TipoCesped VARCHAR(20),
AnioConstruccion DATE,
NombClub VARCHAR(20)
)


CREATE TABLE VENTA(
idEstadio INT,
idVenta INT IDENTITY(1,1) NOT NULL,
NomCajero VARCHAR(20),
NumRegistradora INT,
TotalVenta INT,
FecVenta DATE,
HoraVenta DATE,
)

CREATE TABLE TICKET(
idTicket INT IDENTITY(1,1) NOT NULL,
NomEstadio VARCHAR(20),
PrecioTicket INT,
Ubicacion VARCHAR(15),
HoraPartido DATETIME,
NomEquipo VARCHAR(20)
)

CREATE TABLE TICKETXVENTA(
idVenta INT NOT NULL,
idTicket INT NOT NULL,
idTicketXVenta INT IDENTITY(1,1) NOT NULL
)


CREATE TABLE PARTIDO(
idArbitro int,
idEquipo int,
idEstadio int,
idTipoResultado int,
idPartido int identity(1,1) not null,
nomRival varchar(20),
nomEntrenadorRival varchar(20),
alineacion varchar(20),
fechaPartido datetime
)

CREATE TABLE INCIDENCIA(
idPartido int,
idGol int,
idTarjeta int,
idIncidencia int identity(1,1) not null,
Descripcion varchar(200)
)

CREATE TABLE ARBITRO(
idTipoArbitro int,
idNacionalidad int,
idArbitro int identity(1,1) not null,
nomArbitro varchar(20),
fechaNacArbitro date,
cantDePartidos int)

/*TABLAS DE MODELO RELACIONAL AJUSTADO*/

CREATE TABLE GOL(
idJugador int,
idGol int identity(1,1) not null,
descripcionGol varchar(200)
)


CREATE TABLE TARJETA(
idJugador int,
idTipoTarjeta int,
idTarjeta int identity(1,1) not null,
Descripcion varchar(200)
)

CREATE TABLE NACIONALIDAD(
idNacionalidad int identity(1,1) not null,
nomNacionalidad varchar(20),
nomPais varchar(20)
)

CREATE TABLE TIPO_ARBITRO(
idTipoArbitro int identity(1,1) not null,
nomTipoArbitro varchar(20)
)

CREATE TABLE TIPO_TARJETA(
idTipoTarjeta int identity(1,1) not null,
nomTarjeta varchar(20)
)

CREATE TABLE ESTADO_JUGADOR(
idEstadoJugador int identity(1,1) not null,
nomEstadoJugador varchar(200)
)

CREATE TABLE TIPO_RESULTADO(
idTipoResultado int identity(1,1) not null,
nomTipoResultado varchar(20)
)

--TABLAS TRIGGERS
CREATE TABLE regGol(idGol int, idRegGol int identity(1,1) not null, fechaGol date)
GO
CREATE TABLE regTarjeta(idTarjeta int ,idRegTarjeta int identity(1,1) not null,fechaTarjeta date)
GO

CREATE TABLE jugadorSeUneAEquipo(
idJugador int,
idEquipo int,
idjugadorSeUneAEquipo int identity(1,1) not null,
fechaJugadorSeUneAEquipo date,
descripcion varchar(200))

CREATE TABLE jugadorDejaAEquipo(
idJugador int,
idEquipo int,
idjugadorDejaAEquipo int identity(1,1) not null,
fechaJugadorDejaAEquipo date,
descripcion varchar(200))

--LLAVES PRIMARIAS

ALTER TABLE JUGADOR ADD CONSTRAINT PK_JUGADOR
PRIMARY KEY(idJugador)

ALTER TABLE EQUIPO ADD CONSTRAINT PK_EQUIPO
PRIMARY KEY( idEquipo )

ALTER TABLE ESTADIO ADD CONSTRAINT PK_ESTADIO
PRIMARY KEY( idEstadio )

ALTER TABLE VENTA ADD CONSTRAINT PK_VENTA
PRIMARY KEY( idVenta )

ALTER TABLE TICKET ADD CONSTRAINT PK_TICKET
PRIMARY KEY( idTicket )

ALTER TABLE TICKETXVENTA ADD CONSTRAINT PK_TICKETXXVENTA
PRIMARY KEY( idTicketXVenta )

ALTER TABLE PARTIDO ADD CONSTRAINT PK_PARTIDO
PRIMARY KEY(idPartido)

ALTER TABLE INCIDENCIA ADD CONSTRAINT PK_INCIDENCIA
PRIMARY KEY(idIncidencia)

ALTER TABLE ARBITRO ADD CONSTRAINT PK_ARBITRO
PRIMARY KEY(idArbitro)

ALTER TABLE GOL ADD CONSTRAINT PK_GOL
PRIMARY KEY(idGol)

ALTER TABLE TARJETA ADD CONSTRAINT PK_TARJETA
PRIMARY KEY(idTarjeta)

ALTER TABLE NACIONALIDAD ADD CONSTRAINT PK_NACIONALIDAD
PRIMARY KEY(idNacionalidad)

ALTER TABLE TIPO_ARBITRO ADD CONSTRAINT PK_TIPO_ARBITRO
PRIMARY KEY(idTipoArbitro)

ALTER TABLE TIPO_TARJETA ADD CONSTRAINT PK_TIPO_TARJETA
PRIMARY KEY(idTipoTarjeta)

ALTER TABLE ESTADO_JUGADOR ADD CONSTRAINT PK_ESTADO_JUGADOR
PRIMARY KEY(idEstadoJugador)  --primaria estadojugador

ALTER TABLE TIPO_RESULTADO ADD CONSTRAINT FK_TIPO_RESULTADO
PRIMARY KEY(idTipoResultado)

--LLAVES FORANEAS

ALTER TABLE JUGADOR ADD CONSTRAINT FK_JUGADOR_EQUIPO
FOREIGN KEY(IdEquipo)
REFERENCES EQUIPO(IdEquipo)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE JUGADOR ADD CONSTRAINT FK_JUGADOR_ESTADO_JUGADOR
FOREIGN KEY(idEstadoJugador)
REFERENCES ESTADO_JUGADOR(idEstadoJugador)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE VENTA ADD CONSTRAINT FK_VENTA_ESTADIO
FOREIGN KEY(idEstadio)
REFERENCES ESTADIO(idEstadio)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE TICKETXVENTA ADD CONSTRAINT FK_TICKETXVENTA_VENTA
FOREIGN KEY(IdVenta)
REFERENCES VENTA(IdVenta)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE TICKETXVENTA ADD CONSTRAINT FK_TICKETXVENTA_TICKET
FOREIGN KEY(IdTicket)
REFERENCES TICKET(IdTicket)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE INCIDENCIA ADD CONSTRAINT FK_INCIDENCIA_PARTIDO
FOREIGN KEY(idPartido)
REFERENCES PARTIDO(idPartido)
ON DELETE NO ACTION
ON UPDATE CASCADE


ALTER TABLE PARTIDO ADD CONSTRAINT FK_PARTIDO_ARBITRO
FOREIGN KEY(idArbitro)
REFERENCES ARBITRO(idArbitro)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE PARTIDO ADD CONSTRAINT FK_PARTIDO_EQUIPO
FOREIGN KEY(idEquipo)
REFERENCES EQUIPO(idEquipo)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE PARTIDO ADD CONSTRAINT FK_PARTIDO_ESTADIO
FOREIGN KEY(idEstadio)
REFERENCES ESTADIO(idEstadio)
ON DELETE NO ACTION
ON UPDATE CASCADE

ALTER TABLE INCIDENCIA ADD CONSTRAINT FK_INCIDENCIA_GOL
FOREIGN KEY(idGol)
REFERENCES Gol(idGol)
ON DELETE NO ACTION
ON UPDATE CASCADE --foranea incidencia con gol catalogo

ALTER TABLE INCIDENCIA ADD CONSTRAINT FK_INCIDENCIA_TARJETA
FOREIGN KEY(idTarjeta)
REFERENCES Tarjeta(idTarjeta)
ON DELETE NO ACTION
ON UPDATE CASCADE --foranea incidencia con tarjeta catalogo

ALTER TABLE ARBITRO ADD CONSTRAINT FK_ARBITRO_TIPO_ARBITRO
FOREIGN KEY(idTipoArbitro)
REFERENCES TIPO_ARBITRO(idTipoArbitro)
ON DELETE NO ACTION
ON UPDATE CASCADE --FORANEA ARBITRO TIPO ARBITRO catalogo

ALTER TABLE ARBITRO ADD CONSTRAINT FK_ARBITRO_NACIONALIDAD
FOREIGN KEY(idNacionalidad)
REFERENCES NACIONALIDAD(idNacionalidad)
ON DELETE NO ACTION
ON UPDATE CASCADE --foranea arbitro nacionalidad catalogo

ALTER TABLE TARJETA ADD CONSTRAINT FK_TARJETA_TIPO_TARJETA
FOREIGN KEY(idTipoTarjeta)
REFERENCES TIPO_TARJETA(idTipoTarjeta)
ON DELETE NO ACTION
ON UPDATE CASCADE --foranea TARJETA TIPO TARJETA ctalogo

ALTER TABLE PARTIDO ADD CONSTRAINT FK_PARTIDO_TIPO_RESULTADO
FOREIGN KEY(idTipoResultado)
REFERENCES TIPO_Resultado(idTipoResultado)
ON DELETE NO ACTION
ON UPDATE CASCADE --foranea PARTIDO TIPO RESULTADO ctalogo

--FIN LLAVES FORANEAS

--TRIGGERS
GO
CREATE TRIGGER TriggerGolJugador ON GOL
FOR INSERT
AS
declare @idJ int;
select @idJ=i.idJugador from inserted i;	
UPDATE JUGADOR SET numGoles = numGoles +1 WHERE @idJ = idJugador 
print 'Jugador hizo gol!'
GO

CREATE TRIGGER TriggerTarjetaJugador ON TARJETA
FOR INSERT
AS
declare @idJ int;
select @idJ=i.idJugador from inserted i;	
UPDATE JUGADOR SET numTarjetas = numTarjetas +1 WHERE @idJ = idJugador 
print 'Jugador recibio tarjeta'
GO



CREATE TRIGGER TriggerJugadorSeUneAEquipo ON JUGADOR
FOR INSERT 
AS
DECLARE @idJ int;
DECLARE @idE int;
SELECT @idJ=i.idJugador from inserted i
SELECT @idE=i.idEquipo from inserted i
INSERT INTO jugadorSeUneAEquipo (idJugador,idEquipo,fechaJugadorSeUneAEquipo,descripcion) VALUES (@idJ, @idE, GETDATE(),'NUEVA TRANSFERENCIA')
print 'Nuevo jugador se ha unido a equipo'
GO

CREATE TRIGGER TriggerJugadorDejaAEquipo ON JUGADOR
FOR DELETE 
AS
DECLARE @idJ int;
DECLARE @idE int;
SELECT @idJ=i.idJugador from deleted i
SELECT @idE=i.idEquipo from deleted i
INSERT INTO jugadorDejaAEquipo (idJugador,idEquipo,fechaJugadorDejaAEquipo,descripcion) VALUES (@idJ, @idE, GETDATE(),'JUGADOR SE RETIRA EQUIPO')
GO

CREATE TRIGGER TriggerGOL ON GOL
FOR INSERT 
AS
DECLARE @idGol int;
SELECT @idGol = i.idGol from inserted i
INSERT INTO regGol(idGol,fechaGol) VALUES (@idGol,GETDATE())
GO

CREATE TRIGGER TriggerRegTarjeta ON TARJETA
FOR INSERT 
AS
DECLARE @idT int;
SELECT @idT = i.idTarjeta from inserted i
INSERT INTO regTarjeta(idTarjeta,fechaTarjeta) VALUES (@idT,GETDATE())
GO
/*SCRIPT DE POBLACION(inserciones en tablas)*/


INSERT INTO EQUIPO (nomEquipo,numJugadores,fechaFundacion,nomEntrenador,numPartidosGanados,numPartidosEmpatados,numPartidosPerdidos,difGoles) VALUES ('Atletico Sensual',22,'1/06/2015','Carlos Suazo',5,3,1,4)
SELECT * FROM EQUIPO

INSERT INTO NACIONALIDAD (nomNacionalidad,nomPais) VALUES ('Español','España')
INSERT INTO NACIONALIDAD (nomNacionalidad,nomPais) VALUES ('Español','Argentina')
INSERT INTO NACIONALIDAD (nomNacionalidad,nomPais) VALUES ('Argentino','España')
INSERT INTO NACIONALIDAD (nomNacionalidad,nomPais) VALUES ('Brasileño','España')
INSERT INTO NACIONALIDAD (nomNacionalidad,nomPais) VALUES ('Aleman','Suiza')
SELECT * FROM NACIONALIDAD

INSERT INTO ESTADO_JUGADOR(nomEstadoJugador) VALUES('Activo')
INSERT INTO ESTADO_JUGADOR(nomEstadoJugador) VALUES('Lesionado')
INSERT INTO ESTADO_JUGADOR(nomEstadoJugador) VALUES('Transferible')
INSERT INTO ESTADO_JUGADOR(nomEstadoJugador) VALUES('Prestamo')
SELECT * FROM ESTADO_JUGADOR

INSERT INTO JUGADOR (idEquipo,idNacionalidad,idEstadoJugador,nomJugador,fechaNacJugador,pieHabil,dorsalJugador,posJugador) VALUES (1,3,2,'Messi','24/06/1987','Izquierdo',10,'ED')
INSERT INTO JUGADOR (idEquipo,idNacionalidad,idEstadoJugador,nomJugador,fechaNacJugador,pieHabil,dorsalJugador,posJugador) VALUES (1,1,1,'Pique','24/06/1987','Derecho',3,'DFC')
INSERT INTO JUGADOR (idEquipo,idNacionalidad,idEstadoJugador,nomJugador,fechaNacJugador,pieHabil,dorsalJugador,posJugador) VALUES (1,3,3,'Mascherano','24/06/1987','Derecho',4,'DFC')
INSERT INTO JUGADOR (idEquipo,idNacionalidad,idEstadoJugador,nomJugador,fechaNacJugador,pieHabil,dorsalJugador,posJugador) VALUES (1,4,1,'Dani','24/06/1987','Derecho',22,'LD')
INSERT INTO JUGADOR (idEquipo,idNacionalidad,idEstadoJugador,nomJugador,fechaNacJugador,pieHabil,dorsalJugador,posJugador) VALUES (1,1,1,'Iniesta','24/06/1987','Derecho',8,'MC')
SELECT * FROM JUGADOR


INSERT INTO ESTADIO (NomEstadio,DireccionEstadio,Capacidad,TipoCesped,AnioConstruccion,NombClub) VALUES ('Cuscatlan','Lomas','30K','Natural','05/08/1995','Atletico Sensual')
SELECT * FROM ESTADIO

INSERT INTO VENTA (idEstadio,NomCajero,NumRegistradora,TotalVenta,FecVenta,HoraVenta) VALUES (1,'Credomatic',25,5000,'9/9/2015','3:00:00')
INSERT INTO VENTA (idEstadio,NomCajero,NumRegistradora,TotalVenta,FecVenta,HoraVenta) VALUES (1,'BA',25,5,'9/9/2015','3:00:00')
INSERT INTO VENTA (idEstadio,NomCajero,NumRegistradora,TotalVenta,FecVenta,HoraVenta) VALUES (1,'CITY',25,2,'9/9/2015','3:00:00')
INSERT INTO VENTA (idEstadio,NomCajero,NumRegistradora,TotalVenta,FecVenta,HoraVenta) VALUES (1,'Credomatic',25,5,'9/9/2015','3:00:00')
INSERT INTO VENTA (idEstadio,NomCajero,NumRegistradora,TotalVenta,FecVenta,HoraVenta) VALUES (1,'BA',25,8,'9/9/2015','3:00:00')
SELECT * FROM VENTA


INSERT INTO TICKET (NomEstadio,PrecioTicket,Ubicacion,HoraPartido,NomEquipo) VALUES ('Cuscatlan',30,'Lomas','5/5/2015','AtleticoSensualvsFAS')
INSERT INTO TICKET (NomEstadio,PrecioTicket,Ubicacion,HoraPartido,NomEquipo) VALUES ('Cuscatlan',10,'Lomas','5/5/2015','AtleticoSensualvsFAS')
INSERT INTO TICKET (NomEstadio,PrecioTicket,Ubicacion,HoraPartido,NomEquipo) VALUES ('Cuscatlan',30,'Lomas','5/5/2015','AtleticoSensualvsFAS')
INSERT INTO TICKET (NomEstadio,PrecioTicket,Ubicacion,HoraPartido,NomEquipo) VALUES ('Cuscatlan',25,'Lomas','5/5/2015','AtleticoSensualvsFAS')
INSERT INTO TICKET (NomEstadio,PrecioTicket,Ubicacion,HoraPartido,NomEquipo) VALUES ('Cuscatlan',30,'Lomas','5/5/2015','AtleticoSensualvsFAS')
SELECT * FROM TICKET

INSERT INTO TICKETXVENTA (idVenta,idTicket) VALUES (1,2)
INSERT INTO TICKETXVENTA (idVenta,idTicket) VALUES (1,3)
INSERT INTO TICKETXVENTA (idVenta,idTicket) VALUES (1,4)
INSERT INTO TICKETXVENTA (idVenta,idTicket) VALUES (2,5)
INSERT INTO TICKETXVENTA (idVenta,idTicket) VALUES (2,5)
SELECT * FROM TICKETXVENTA


INSERT INTO TIPO_ARBITRO (nomTipoArbitro) VALUES('Arbitro de Línea')
INSERT INTO TIPO_ARBITRO (nomTipoArbitro) VALUES('Arbitro de Meta')
INSERT INTO TIPO_ARBITRO (nomTipoArbitro) VALUES('Arbitro Central')
SELECT * FROM TIPO_ARBITRO

INSERT INTO ARBITRO (idTipoArbitro,idNacionalidad,nomArbitro,fechaNacArbitro,cantDePartidos) VALUES (1,1,'Borbalan','15/2/1980',15)
INSERT INTO ARBITRO (idTipoArbitro,idNacionalidad,nomArbitro,fechaNacArbitro,cantDePartidos) VALUES (2,2,'Aguirres','15/2/1980',15)
INSERT INTO ARBITRO (idTipoArbitro,idNacionalidad,nomArbitro,fechaNacArbitro,cantDePartidos) VALUES (3,3,'Lopez','15/2/1980',15)
INSERT INTO ARBITRO (idTipoArbitro,idNacionalidad,nomArbitro,fechaNacArbitro,cantDePartidos) VALUES (1,2,'Romero','15/2/1980',15)
INSERT INTO ARBITRO (idTipoArbitro,idNacionalidad,nomArbitro,fechaNacArbitro,cantDePartidos) VALUES (2,3,'Polanco','15/2/1980',15)
SELECT * FROM ARBITRO

INSERT INTO TIPO_RESULTADO (nomTipoResultado) VALUES ('Ganado')
INSERT INTO TIPO_RESULTADO (nomTipoResultado) VALUES ('Empatado')
INSERT INTO TIPO_RESULTADO (nomTipoResultado) VALUES ('Perdido')
SELECT * FROM TIPO_RESULTADO


INSERT INTO PARTIDO (idArbitro,idEquipo,idEstadio,idTipoResultado,nomRival,nomEntrenadorRival,alineacion,fechaPartido) VALUES (1,1,1,1,'Alianza','Curvelo','4-3-3','5/5/2015')
INSERT INTO PARTIDO (idArbitro,idEquipo,idEstadio,idTipoResultado,nomRival,nomEntrenadorRival,alineacion,fechaPartido) VALUES (2,1,1,2,'Marte','Mendes','4-3-3','5/5/2015')
INSERT INTO PARTIDO (idArbitro,idEquipo,idEstadio,idTipoResultado,nomRival,nomEntrenadorRival,alineacion,fechaPartido) VALUES (3,1,1,3,'Fas','Portillo','4-3-3','5/5/2015')
INSERT INTO PARTIDO (idArbitro,idEquipo,idEstadio,idTipoResultado,nomRival,nomEntrenadorRival,alineacion,fechaPartido) VALUES (4,1,1,1,'Aguila','Valdes','4-3-3','5/5/2015')
INSERT INTO PARTIDO (idArbitro,idEquipo,idEstadio,idTipoResultado,nomRival,nomEntrenadorRival,alineacion,fechaPartido) VALUES (5,1,1,2,'Metapan','Zeleda','4-3-3','5/5/2015')
SELECT * FROM PARTIDO


INSERT INTO GOL (idJugador,descripcionGol) VALUES (1,'Cabeza')
INSERT INTO GOL (idJugador,descripcionGol) VALUES (1,'Remate')
INSERT INTO GOL (idJugador,descripcionGol) VALUES (2,'Centro')
INSERT INTO GOL (idJugador,descripcionGol) VALUES (5,'Penal')
INSERT INTO GOL (idJugador,descripcionGol) VALUES (4,'Tiro Libre')

SELECT * FROM GOL
SELECT * FROM JUGADOR

INSERT INTO TIPO_TARJETA (nomTarjeta) VALUES ('Amarilla')
INSERT INTO TIPO_TARJETA (nomTarjeta) VALUES ('Roja')
SELECT * FROM TIPO_TARJETA

INSERT INTO TARJETA (idJugador,idTipoTarjeta,Descripcion) VALUES (1,1,'Falta')
INSERT INTO TARJETA (idJugador,idTipoTarjeta,Descripcion) VALUES (2,1,'Falta')
INSERT INTO TARJETA (idJugador,idTipoTarjeta,Descripcion) VALUES (3,2,'Mano')
INSERT INTO TARJETA (idJugador,idTipoTarjeta,Descripcion) VALUES (4,1,'Falta')
INSERT INTO TARJETA (idJugador,idTipoTarjeta,Descripcion) VALUES (5,2,'Falta')
SELECT * FROM TARJETA

INSERT INTO INCIDENCIA (idPartido,idGol,idTarjeta,Descripcion) VALUES (2,1,1,'Gol')
INSERT INTO INCIDENCIA (idPartido,idGol,idTarjeta,Descripcion) VALUES (3,1,1,'Falta')
INSERT INTO INCIDENCIA (idPartido,idGol,idTarjeta,Descripcion) VALUES (4,1,1,'Gol')
INSERT INTO INCIDENCIA (idPartido,idGol,idTarjeta,Descripcion) VALUES (3,1,1,'Tarjeta')
INSERT INTO INCIDENCIA (idPartido,idGol,idTarjeta,Descripcion) VALUES (1,1,1,'Gol')
SELECT * FROM INCIDENCIA




--------------------SCRIPT DE VACIADO

/*USE CLUB
GO
 
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' --Deshabilitando todos los triggers y las restricciones de cada tabla
GO
EXEC sp_MSForEachTable 'ALTER TABLE ? DISABLE TRIGGER ALL' --Deshabilitando todos los triggers y las restricciones de cada tabla
GO
 
EXEC sp_MSForEachTable --Eliminando los datos de cada una de las tablas.
    'BEGIN TRY
        TRUNCATE TABLE ?
    END TRY
    BEGIN CATCH
        DELETE FROM ?
    END CATCH;'
EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL' --Volvemos a habilitar las restricciones de tipo check y los triggers para que la Base de Datos sigua funcionando con normalidad.
GO
EXEC sp_MSForEachTable 'ALTER TABLE ? ENABLE TRIGGER ALL'
GO
---------------------FIN SCRIPT DE VACIADO*/


---------------------SCRIPT DE BORRADO
/*
DROP TABLE INCIDENCIA
DROP TABLE PARTIDO
DROP TABLE TIPO_RESULTADO
DROP TABLE TICKETXVENTA
DROP TABLE TICKET
DROP TABLE VENTA
DROP TABLE ESTADIO
DROP TABLE ARBITRO
DROP TABLE TIPO_ARBITRO
DROP TABLE NACIONALIDAD
DROP TABLE JUGADOR
DROP TABLE ESTADO_JUGADOR
DROP TABLE EQUIPO
DROP TABLE GOL
DROP TABLE TARJETA
DROP TABLE TIPO_TARJETA
DROP TABLE TIPO_ARBITRO

USE MASTER
GO
DROP DATABASE CLUB

*/
---------------------FIN SCRIPT DE BORRADO

SELECT * FROM ESTADIO WHERE idEstadio=1

SELECT * FROM JUGADOR WHERE idJugador=1

SELECT * FROM VENTA WHERE idVenta=1

--Nombre jugador y su estado
SELECT j.nomJugador,e.nomEstadoJugador
FROM JUGADOR j INNER JOIN ESTADO_JUGADOR e
ON e.idEstadoJugador=j.idEstadoJugador

--Nombre rival y tipo de resultado
SELECT p.nomRival,t.nomTipoResultado
FROM PARTIDO p INNER JOIN TIPO_RESULTADO t
ON p.idTipoResultado=t.idTipoResultado

--Nombre arbitro y su tipo
SELECT  a.nomArbitro, TA.nomTipoArbitro
FROM ARBITRO a INNER JOIN TIPO_ARBITRO TA
ON a.idTipoArbitro=TA.idTipoArbitro

--Nacionalidad del arbitro del partido
SELECT P.nomRival,N.nomNacionalidad
FROM PARTIDO P INNER JOIN ARBITRO A
ON	P.idArbitro=A.idArbitro INNER JOIN NACIONALIDAD N
ON A.idNacionalidad=N.idNacionalidad

--Goles de cada partido
SELECT p.nomRival,g.idJugador
FROM PARTIDO p INNER JOIN INCIDENCIA i
ON p.idPartido=i.idPartido INNER JOIN GOL g
ON i.idGol=g.idGol

--Genera el estado de un jugador
SELECT e.nomEstadoJugador,j.nomJugador
FROM ESTADO_JUGADOR e INNER JOIN JUGADOR J
ON e.idEstadoJugador=1 AND J.idEstadoJugador=1

--Nombre rival de cierto tipo de resultado
SELECT p.nomRival,t.nomTipoResultado
FROM PARTIDO p INNER JOIN TIPO_RESULTADO t
ON p.idTipoResultado=1 AND t.idTipoResultado=1