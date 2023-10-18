select
	e.nome as empregado,
    e.civil as est_civil,
    format(datediff(now(),e.dt_nascimento)/365,0) as emp_idade,
    e.salario as renda,
    count(d.cod_dep) as dependentes,
    concat("R$  ", format(if(e.salario <= 2112, 0,
	  if(e.salario>2112 and e.salario<=2826.65, ((e.salario * 13.3)*0.075),
		  if(e.salario>2826.65 and e.salario<=3751.05, ((e.salario * 13.3)*0.15),
			  if(e.salario>3751.05 and e.salario<=4664.68,((e.salario * 13.3)*0.225), ((e.salario * 13.3)*0.275))
		  )
	  )
  ),2)) as Imposto
from empregado e
left join dependente d
on e.cod_emp = d.cod_emp
group by e.nome, e.civil, e.salario, e.dt_nascimento;   