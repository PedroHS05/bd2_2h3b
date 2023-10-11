select
  nome as nome,
  salario as renda,
  if(salario <= 2112, 0,
	  if(salario>2112 and salario<=2826.65, "Faixa 7,5%",
		  if(salario>2826.65 and salario<=3751.05, "Faixa 15%",
			  if(salario>3751.05 and salario<=4664.68,"Faixa 22,5%", "Faixa 27,5%")
		  )
	  )
  ) as IRPF,
  format(if(salario <= 2112, 0,
	  if(salario>2112 and salario<=2826.65, ((salario * 13.3)*0.075),
		  if(salario>2826.65 and salario<=3751.05, ((salario * 13.3)*0.15),
			  if(salario>3751.05 and salario<=4664.68,((salario * 13.3)*0.225), ((salario * 13.3)*0.275))
		  )
	  )
  ),2) as Imposto
from
	empregado;
  