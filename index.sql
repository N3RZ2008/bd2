CREATE DATABASE DanielRocha2A;
USE DanielRocha2A;

CREATE TABLE paciente (
id_paciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
paciente VARCHAR(60),
cpf VARCHAR(14)
);

CREATE TABLE medico (
id_medico INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
medico VARCHAR(60),
especialidade VARCHAR(60)
);

CREATE TABLE exame (
id_exame INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
id_paciente INT NOT NULL,
paciente VARCHAR(60),
id_medico INT NOT NULL,
medico VARCHAR(60),
tipo_exame VARCHAR(60),
data_exame DATE,

foreign key (id_paciente) references paciente (id_paciente),
foreign key (id_medico) references medico (id_medico)
);



DELIMITER $$
create procedure cad_paciente(
p_paciente VARCHAR(60),
p_cpf VARCHAR(14)
)
BEGIN
insert into paciente (paciente, cpf) values (p_paciente, p_cpf);
END$$
DELIMITER $$

DELIMITER $$
create procedure cad_medico(
p_medico VARCHAR(60),
p_especialidade VARCHAR(60)
)
BEGIN
insert into medico (medico, especialidade) values (p_medico, p_especialidade);
END$$
DELIMITER $$

DELIMITER $$
create procedure cad_exame(
p_id_paciente INT,
p_paciente VARCHAR(60),
p_id_medico INT,
p_medico VARCHAR(60),
p_tipo_exame VARCHAR(60),
p_data_exame DATE
)
BEGIN
insert into exame (id_paciente, paciente, id_medico, medico, tipo_exame, data_exame) values (p_id_paciente, p_paciente, p_id_medico, p_medico, p_tipo_exame, p_data_exame);
END$$
DELIMITER $$

call cad_paciente ("Thihago", "000.000.000-00");
call cad_medico ("Cleber", "Oftalmologista");
call cad_exame (1, "Thihago", 1, "Cleber", "Olho", '1985-09-20');

select * from paciente;
select * from medico;
select * from exame;
