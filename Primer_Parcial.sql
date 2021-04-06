CREATE DATABASE primerParcial;

USE primerParcial;

/*CREACION DE TABLA INGRESO*/
CREATE TABLE ingreso(
id_ingreso INT NOT NULL,
nombre VARCHAR(50),
nit INT,
direccion VARCHAR(100),
correo VARCHAR(100),
departament VARCHAR(50),
genero VARCHAR (5),
status VARCHAR(20),
PRIMARY KEY(id_ingreso)
);

/*CREACION DE TABLA Bitacora*/
CREATE TABLE bitacora(
id_bitacora INT not null AUTO_INCREMENT PRIMARY KEY,
fecha_hora DATETIME, 
usuario VARCHAR(50),
status VARCHAR(20),
accion  VARCHAR(20)
);

 /*Ingreso de 5 registros a la tabla INGRESO*/
INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9001,'steven',12345678,'zona 5','steven@gmail.com','computo','M','soltero');

INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9002,'marvin',87654123,'zona 18','marvin@gmail.com','it','M','casado');

INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9003,'omar',45678123,'zona 1','omar@gmail.com','gerente','M','soltero');

INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9004,'karin',85231475,'zona 21','karin@gmail.com','recepcion','F','casada');

INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9005,'rebeca',41200347,'zona 6','rebeca@gmail.com','mantenimiento','F','soltera');


/*creacion de trigger para INSERT*/
CREATE TRIGGER insertEmpleado AFTER INSERT
ON ingreso
FOR EACH ROW
INSERT INTO bitacora(id_bitacora,fecha_hora,usuario,status,accion)
VALUES (NEW.id_ingreso,NOW(),NEW.nombre,NEW.status,'Insertado');

/*Validar el funcionamiento de TRIGGER INSERT*/
INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9006,'andy',74568213,'zona 3','andy@gmail.com','computo','M','soltera');

INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9007,'jefry',78412035,'zona 15','jefry@gmail.com','supervisor','M','casado');

/*creacion de trigger para DELETE*/
CREATE TRIGGER deletetEmpleado AFTER DELETE
ON ingreso
FOR EACH ROW
INSERT INTO bitacora(id_bitacora,fecha_hora,usuario,status,accion)
VALUES (old.id_ingreso,NOW(),old.nombre,old.status,'Eliminado');

/*creacion de trigger para UPDATE*/
CREATE TRIGGER uptadeEmpleado AFTER UPDATE
on ingreso
FOR EACH ROW
INSERT INTO bitacora(id_bitacora,fecha_hora,usuario,status,accion)
VALUES (new.id_ingreso,NOW(),new.nombre,new.status,'Modificado');

/*Validar el funcionamiento de TRIGGER DELETE*/
/*Primero ingresamos 2 datos nuevos luego eliminaremos uno de ellos*/
INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9008,'emily',75631003,'zona 5','emily@gmail.com','contadora','F','soltera');

INSERT INTO ingreso(id_ingreso,nombre,nit,direccion,correo,departament,genero,status) 
VALUES (9009,'Britani',74175681,'zona 7','britani@gmail.com','rrhh','F','casada');

SELECT *FROM ingreso;
SELECT *FROM bitacora;

