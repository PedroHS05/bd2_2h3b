/*Faixa Inteira*/
select
	*
from 
	empregado
where
	cod_emp between 5 and 11;
    
/*Espaço de Amostras*/

select
	*
from 
	empregado
where
	cod_emp /*not*/ in(5, 6, 2);

/*Formatos de Data*/

select
	nome as empregado,
    salario as renda,
    format((datediff(now(), dt_nascimento)/365),0) as idade,
    format((datediff(now(), dt_admissao)/365),0)as tempo_empresa
from
	empregado;
/*Acumulador de Valor*/
select
    max(format((datediff(now(), dt_admissao)/365),0)) as tempo_empresa
from 
	empregado;
select
    min(format((datediff(now(), dt_admissao)/365),0)) as tempo_empresa
from 
	empregado;
    
/*Filtro Composto*/

select
	nome as empregado,
    salario as renda,
    sexo as genero,
    format((datediff(now(), dt_nascimento)/365),0) as idade
from
	empregado
where
	format((datediff(now(), dt_admissao)/365),0)=
    (select max(format((datediff(now(), dt_admissao)/365),0)) as tempo_empresa from empregado);

select
	nome as empregado,
    salario as renda,
    sexo as genero,
    format((datediff(now(), dt_nascimento)/365),0) as idade
from
	empregado
where
	format((datediff(now(), dt_admissao)/365),0)=
    (select min(format((datediff(now(), dt_admissao)/365),0)) as tempo_empresa from empregado);
