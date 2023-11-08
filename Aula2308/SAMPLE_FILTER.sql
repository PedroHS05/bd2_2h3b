select * from empregado;
select * from dependente;
select * from departamento;

/*Acumuladores*/
select count(*) as n_dependentes from dependente;
select sexo, count(cod_dep) as n_genero from dependente group by sexo;