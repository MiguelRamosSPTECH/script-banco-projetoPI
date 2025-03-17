use projetoPi;

-- INSERÇÃO DOS DADOS --

insert into sensor values (null, 'Ativo'),
						  (null, 'Inativo'),
                          (null, 'Manutenção'),
                          (null, 'Ativo'),
                          (null, 'Manutenção'),
                          (null, 'Ativo'),
                          (null, 'Ativo'),
                          (null, 'Ativo'),
                          (null, 'Inativo'),
                          (null, 'Inativo'),
                          (null, 'Manutenção');
/* 
legenda 
	status 0 -> inativo
    status 1 -> ativo
    status 2 -> manutenção
    
*/

-- tabela dadosSensor --
insert into dadosSensor values (null, 2.2, now(), 'Escassez', 1),
							   (null, 0.5, now(), 'Escassez', 1),
                               (null, 3.0, now(), 'Escassez', 1),
                               (null, 5.7, now(), 'Excesso', 2),
                               (null, 5.5, now(), 'Excesso', 2),
                               (null, 0.8, now(), 'Escassez', 2),
                               (null, 1.5, now(), 'Escassez', 3),
                               (null, 6, now(), 'Excesso', 3),
                               (null, null, now(), 'Falha Sensor', 3);
/* 
legendas
    nivelAlerta 1 -> Escassez ou excesso, podemos diferenciar um dos dois de acordo com o volumeLitro enviado
    nivelAlerta 2 -> Vazamento
    nivelAlerta 3 -> Falha Sensor
*/

-- tabela montadora --
insert into montadora values(null, 'Honda', '61.664.410/0001-21', 'hondaMontadora@gmail.com', 'a8d7f6g5h4j3k2l1m9n8b7v6c5x4z3w2q1'),
							(null, 'Porsche', '04.481.368/0001-70', 'porscheMontadora@gmail.com', 'y7t6r5e4w3q2a1s9d8f7g6h5j4k3l2m1n'),
                            (null, 'RAM', '78.233.043/0001-04', 'ramMontadora@gmail.com', 'p9o8i7u6y5t4r3e2w1q9a8s7d6f5g4h3j'),
                            (null, 'Chevrolet', '80.674.299/0001-07', 'chevroletMontadora@gmail.com', 'z3x2c1v9b8n7m6l5k4j3h2g1f9d8s7a6w'),
                            (null, 'Audi', '10.931.303/0001-81', 'audiMontadora@gmail.com', 'q2w3e4r5t6y7u8i9o0p1a2s3d4f5g6h7j');


-- tabela funcionarioMontadora (perfil da montadora para a dash) --
insert into funcionarioMontadora values (null, 'Sergio Santos Silva', 'sergio.honda@gmail.com', 'H4NDS09&MNZ2025', null, 1),
										(null, 'Brandão', 'brandão.porsche@gmail.com', '123098PSt2025', null, 2),
                                        (null, 'Marcelo Rosim', 'rosim.ram@gmail.com', '12345678', null, 3),
                                        (null, 'Marcio', 'marcio.chevrolet@gmail.com', '987654321', null, 4),
                                        (null, 'Clara', 'clara.audi@gmail.com', '8790123654', null, 5);

-- tabela carro --
insert into carro values (null, 'Civic', '2019/2020', 'GOD-8900', 1, 1),
						 (null, '911', '2024/2025', 'JVD9172', 3, 2),
                         (null, 'Rampage', '2023/2024', 'NEG3431', 5, 3),
                         (null, 'Camaro', '2022/2023', 'HUE0572', 2, 4),
                         (null, 'TT', '2025', 'MQC3189', 4, 5);

-- selects --

-- sensor --
select * from sensor;

select *,
case
	when statusSensor = 0 then 'Inativo'
    when statusSensor = 1 then 'Ativo'
    else 'Manutenção'
end as 'Descricao' from sensor;

-- dadosSensor --
select * from dadosSensor;

select idDadosSensor as 'Registro.Dado', 
volumeLitros as 'Litros', 
dataHoraColeta 'Horario.Coleta', 
nivelAlerta as 'Nível.Alerta', idSensor as 'Sensor' 
from dadosSensor; 

select concat('O sensor ',idSensor, ' detectou ',nivelAlerta, ' de óleo no horário ',dataHoraColeta) 'Alerta' 
from dadosSensor where idSensor = 2;

-- montadora --
select * from montadora;
select idMontadora as 'Registro',
nomeMontadora as 'Montadora',
cnpjMontadora as 'CNPJ',
emailMontadora 'Email'
from montadora;

select concat('A montadora ', nomeMontadora, ' com email: ',emailMontadora,' é nosso cliente!') as 'Mensagem'
from montadora where idMontadora = 1;

-- funcionarios Montadora --
select * from funcionarioMontadora;

select concat(nomeFuncionario, ' - ', emailFuncionario) as 'Contato do Funcionario' from funcionarioMontadora;

select idFuncionarioMontadora as 'Registro',
nomeFuncionario as 'Nome.Funcionario',
emailFuncionario as 'Email',
senhaFuncionario as 'Senha',
imagemFuncionario as 'Foto',
idMontadora as 'Montadora.Pertencente'
from funcionarioMontadora;

-- carro --
select * from carro;

select
    modeloCarro, 
    anoCarro, 
    placaCarro 
from carro order by anoCarro desc;


