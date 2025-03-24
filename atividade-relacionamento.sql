-- Active: 1742234998135@@127.0.0.1@3306@sprint2

use sprint2;

create table pet(
idPet int primary key auto_increment,
nome varchar(45),
raca varchar(45),
fkMae int,
fkPai int,
constraint fkFilhoMae foreign key (fkMae)
	references pet(idPet),
constraint fkFilhoPai foreign key (fkPai)
	references pet(idPet)
);

insert into pet values
	(default,'Homero','Vira-Lata',null,null),
    (default,'Marge','Vira-Lata',null,null),
    (default,'Bart','Vira-Lata', 2, 1);

insert into pet values
	(default,'Scooby doo mãe','Vira-Lata',null,null),
    (default,'Scooby doo pai','Vira-Lata',null,null),
    (default,'Scooby doo','Vira-Lata', 4, 5);

insert into pet (nome) values
	('Scooby doo avó (mãe da mãe)'),
    ('Scooby doo avô (pai do pai)');

SELECT * from pet;

UPDATE pet SET fkMae = 7, fkPai = 8
    WHERE idPet = 5;

SELECT 
    filho.nome as Filho,
    mae.nome as Mãe,
    avó.nome as Avó,
    avô.nome as Avô
FROM pet as filho
JOIN pet as mae
    ON filho.fkMae = mae.idPet
LEFT JOIN pet as avó
    ON mae.fkMae = avó.idPet
LEFT JOIN pet as avô
    ON mae.fkPai = avô.idPet;


TRUNCATE pet;

-- não sei o pq não funciona sem o left