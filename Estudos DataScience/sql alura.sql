
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR,
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em timestamp
);

select * from aluno;

insert into aluno(
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) values (
	'Diogo',
	'123123123',
	'Lorem ipsum dolor sit amet, consescutr',
	35,
	100.50,
	1.70,
	true,
	'1984-08-27',
	'17:30:00',
	'2021-08-22 12:32:12'
);


insert into aluno (
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) values (
	'John',
	'12256487988',
	'esse e um exemplo',
	'20',
	1.80,
	1280.00,
	true,
	'1999-12-10',
	'13:00:00',
	'2021-08-22 08:29:00'
);

select *
  from aluno
where id = 2;  

update aluno
  set dinheiro = 1280.00,
      altura = 1.80
where id = 2;

select * from aluno;

 insert into aluno (
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
 ) values (
	'Flavio',
	'45698712355',
	'teste3',
	'30',
	500.00,
	1.72,
	false,
	'1989-06-10',
	'08:30:00',
	'2021-07-10 16:00:20'
 );

 insert into aluno (
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
 ) values (
	'Marcos',
	'75489246511',
	'este e outro teste',
	'23',
	890.25,
	1.87,
	true,
	'1992-01-06',
	'18:30:00',
	'2020-01-01 13:00:50'
 );      

 select
  nome as "Nome do aluno",
  idade
 from aluno;
 select
  nome as "Nome do aluno",
  ativo as "Matricula ativa/desativ"
 from aluno;
 select 
	nome as "Nome do aluno",
	idade,
	ativo as "Matricula ativa/desativ",
	hora_aula as "Horario da aula"
from aluno;
 select 
	nome as "Nome do aluno",
	ativo "Matricula ativa/desativ",
	matriculado_em as "Data da matricula"
 from aluno;
 select
	nome as "Nome do aluno",
	idade,
	altura,
	data_nascimento as "Data de nascimento"
from aluno;


insert into aluno (nome) values ('Joao carlos');
insert into aluno (nome) values ('Pollyanna');
insert into aluno (nome) values ('Diego');
insert into aluno (nome) values ('Marcela');

select * from aluno;

-- CONSULTA E TRAZ TUDO DIFERENTE DE DIOGO
select *
from aluno
where nome != 'Diego';

-- OPERADOR LIKE DE PESQUISA FUNCIONA COMO SE SIGNIFICASSE "PARECIDO" ELE PESQUISA OQUE E PARECIDO
select *
from aluno
where nome like 'Di_go';

-- OPERADOR NOT LIKE IGNORA OQUE SE PARECE COM A PESQUISA E TRAZ TUDO OQUE E DIFERENTE
select *
from aluno
where nome not like 'Di_go';

-- O CARACTERE % NA PESQUISA SIGNIFICA PESQUISAR QUALQUER COISA ATE CERTO PONTO, O PONTO E DEFINIDO PELO CARACTERE.

select *
from aluno
where nome like 'D%'; -- RETORNA TUDO EM NOME QUE COMEÇA COM D

select * 
from aluno
where nome like '%s'; -- RETORNA TUDO EM NOME QUE TERMINA COM S

select * 
from aluno
where nome like '% %'; -- DOIS CARACTERES COM ESPAÇO NO MEIO RETORNA DE NOME OS NOMES QUE TEM ESPAÇO NO MEIO

select * from aluno;

-- FILTRANDO REGISTROS DE CAMPOS DO TIPO NUUMERICO,DATA E BOOLEAN

select *
from aluno
where cpf is not null; -- TRAZ NA PESQUISA AS LINHAS QUE POSSUEM CPF OU SEJA "IS NOT NULL"

select *
from aluno
where cpf is null; -- TRAZ NA PESQUISA DE CPF AS LINHAS QUE NAO POSSUEM CPF OU CPF E NULL OU SEJA "IS NULL"

select *
from aluno
where idade < 35; -- NESTA BUSCA DO TIPO INTEGER Q E UM NUMERO PODE SE UTILIZAR OS OPERADORES <>(DIFERENTE), =,  >=, <=, <, >, RETORNANDO ASSIM 
--SUAS RESPECTIVAS LOGICAS Q FORAM APLICADAS.


select *
from aluno
where idade between 10 and 35; -- O TIPO DE FILTRI BETWEEN(ENTRE)TRAZ OS NUMERO Q ESTAO ENTRE OS VALORES COLOCADOS NO FILTRO COMO NO EXEMPLO

select *
from aluno
where ativo = true; -- ESSE FILTRO E PARA BOOLEAN TRAZ OQUE E APENAS TRUE PARA PESQUISAR OS FALSE BASTA APENAS TROCAR NA CHAMADA.

select *
from aluno
where ativo is null;-- NESTE FILTRO DE BOOLEAN ELE TRAZ OS VALOES BOOLEANOS QUE SÃO NULOS.


-- FILTRANDO UTILIZANDO OPERADORES E e OU
-- O OPERADOR AND SO TRAZ RESULTADOS QUANDO AS DUAS CONDIÇÕES FOREM VERDADEIRAS

select *
from aluno
where nome like 'D%'
    and cpf is not null; -- TROUXE DIOGO POIS O CPF DELE NAO E NULO.

-- O OPERADOR OR ELE SO PRECISA QUE UMA DAS CONDIÇÕES SEJA VERDADEIRA.    
select *
from aluno
where nome like 'Diogo'
   or nome like 'Rodrigo'
   or nome like 'Pollyanna';

-- CRIANDO CHAVE PRIMARIA NO CASO O ID COMO PRIMARY KEY ( ELE NAO ACEITA VALORES NULOS E NEM COM OS MESMOS NUMEROS), NO VARCHAR OBSERVAMOS
-- QUE EXISTE O NOT NULL UNIQUE OU SEJA ELE E DE VALOR UNICO E NAO ACEITA VALORES NULOS.
create table curso (
	id integer primary key,
	nome varchar(255)not null unique
);

insert into curso (id, nome) values (null, null);
insert into curso (id, nome) values (1, 'HTML');
insert into curso (id, nome) values (2, 'JAVASCRIPT');

select * from curso;

DROP TABLE curso;

-- CHAVES ESTRANGEIRAS ************

select * from aluno;

create table aluno2 ( 
	id serial primary key,
	nome varchar(255) not null
);

select * from aluno2;	


insert into aluno2 (nome) values ('Diogo');
insert into aluno2 (nome) values ('Vinicius');
insert into aluno2 (nome) values ('Matheus');
insert into aluno2 (nome) values ('Pollyanna');

create table aluno_curso (
	aluno_id integer,
	curso_id integer,
	primary key(aluno_id, curso_id),

	foreign key (aluno_id)
	references aluno2 (id),

	foreign key (curso_id)
	references curso (id)
);

drop table aluno_curso;

select * from aluno_curso;	

insert into aluno_curso (aluno_id, curso_id) values (1,1);
insert into aluno_curso (aluno_id, curso_id) values (2,1);

select * from aluno2 where id =1;






 
 