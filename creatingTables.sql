-- CRIAÇÃO DA BASE DADOS DO NOSSO PROJETO --
CREATE DATABASE projetoPi;

use projetoPi;

create table sensor(
	idSensor int primary key auto_increment,
    statusSensor varchar(11)
);

create table dadosSensor(
	idDadosSensor int primary key auto_increment,
    volumeLitros decimal(5,2) default(null),
    dataHoraColeta datetime,
    nivelAlerta varchar(25) default('Falha Sensor'),
	idSensor int not null,
    constraint fk_idSensor foreign key(idSensor) references sensor(idSensor)	
);

create table montadora(
	idMontadora int primary key auto_increment,
    nomeMontadora varchar(70) not null,
    cnpjMontadora char(18) unique not null,
    emailMontadora varchar(50) unique not null,
    token varchar(255) unique not null
);

create table funcionarioMontadora(
	idFuncionarioMontadora int primary key auto_increment,
    nomeFuncionario varchar(50) not null,
    emailFuncionario varchar(60) unique,
    senhaFuncionario varchar(50),
    imagemFuncionario varchar(100) default(null),
    idMontadora int,
    constraint fk_idMontadora foreign key(idMontadora) references montadora(idMontadora)
);

create table carro(
	idCarro int primary key auto_increment,
    modeloCarro varchar(100) not null,
    anoCarro varchar(9),
    placaCarro varchar(15) unique,
    idSensor int,
    idMontadora int,
    constraint fk_idSensorCarro foreign key(idSensor) references sensor(idSensor),
    constraint fk_idMontadoraCarro foreign key(idMontadora) references montadora(idMontadora),
    unique key ix_idSensor(idSensor)
);

-- um carro só pode ter um sensor, se eu deixar o idCarro no sensor um carro pode ter varios sensores
drop database projetoPi;
