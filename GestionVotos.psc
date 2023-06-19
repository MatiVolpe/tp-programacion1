Proceso GestionVotos
	//Desarrollar un sistema en PSeint que permita registrar la cantidad de votos obtenidos por cada uno de los 5 candidatos en cada una de las 4 escuelas designadas para la última elección en la ciudad de Chivilcoy. 
	//El sistema debe permitir la carga de los votos obtenidos para cada candidato en cada escuela. 
	//Diseñar un menú que luego de la carga de los datos permita al usuario interactuar de forma iterativa con el mismo eligiendo alguna de la siguientes opciones:
	//Determinar el candidato con la mayor cantidad de votos y mostrar su nombre junto con la cantidad de votos obtenidos.
	//La cantidad de votantes de cada escuela.
	//Generar un informe con los resultados detallados de cada candidato en cada escuela, mostrando la cantidad de votos obtenidos en cada una.
	//Para obtener el candidato ganador armar una función que retorne los datos necesarios y en el proceso principal mostrar los resultados;  para mostrar la cantidad de votantes de cada escuela armar un subproceso.
	
	Definir escuelas Como Entero
	Dimension escuelas[5, 4]
	Definir menu Como Entero 
	
	Definir datosGanador Como Entero
	Dimension datosGanador[2]
	Definir candidatos Como Cadena
	Dimension candidatos[5]
	candidatos[0] = "Lourdes Zaccardi"
	candidatos[1] = "Constanza Alonso"
	candidatos[2] = "Leandro Blanco"
	candidatos[3] = "Eugenia Gandolfo"
	candidatos[4] = "Javier Gallo"
	
	
	
	
	Escribir "Bienvenido al gestor de votos de Chivilcoy"
	Escribir "<---------------------------------------->"
	cargarVotos(candidatos, escuelas)
	
	
	
	Repetir
		Escribir "Ingrese la opcion deseada:"
		Escribir "1- Mostrar candidato ganador"
		Escribir "2- Cantidad de votantes de cada escuela"
		Escribir "3- Informe general de las elecciones de Chivilcoy"
		Escribir "4- Salir"
		Leer menu
		
		Segun menu Hacer
			1:
				candidatoGanador(candidatos, escuelas, datosGanador)
				Escribir "<----------------------------------------------------------------------->"
				Escribir "El candidato ganador y por ende futuro Intendente de Chivilcoy es: ", candidatos[datosGanador[0]], " con ", datosGanador[1], " votos!!"
				Escribir "<----------------------------------------------------------------------->"
			2:
				votantesEscuela(candidatos, escuelas)
			3:
				informeFinal(candidatos, escuelas)
			4:
				Escribir "Gracias!!"
			De Otro Modo:
				Escribir "La opcion ingresada es incorrecta"
		Fin Segun
	Mientras Que menu <> 4
	
	
	
	
	
FinProceso

SubProceso cargarVotos(candidatos, escuelas)
	Definir voto Como Entero
	Escribir "A continuacion vamos a cargar los votos de los candidatos en cada escuela:"
	Escribir "<----------------------------------------------------------------------->"
	
	voto = 1
	
	Para i = 0 Hasta 4 Con Paso 1 Hacer
		Para j = 0 Hasta 3 Con Paso 1 Hacer
			Escribir "<-------------------------------------------------------------------------------->"
			Escribir "Ingrese la cantidad de votos del candidato ", candidatos[i], " en la escuela nro:", j + 1
			Leer voto
			Mientras voto <= 0 Hacer
				Leer voto
				Si voto <= 0 Entonces
					Escribir "Recuerde que un candidato no puede tener votos negativos, ingrese un valor valido"
				FinSi
			Fin Mientras
			escuelas[i, j] = voto
		Fin Para
	Fin Para
	
FinSubProceso

Funcion  candidatoGanador(candidatos, escuelas, datosGanador)
	Definir ganador, aux Como Entero
	aux = 0
	Para i = 0 Hasta 4 Con Paso 1 Hacer
		aux = 0
		Para j = 0 Hasta 3 Con Paso 1 Hacer
			aux = aux + escuelas[i, j]
		Fin Para
		Si aux > datosGanador[1] Entonces
			datosGanador[0] = i
			datosGanador[1] = aux
		FinSi
	Fin Para
	
FinFuncion

SubProceso votantesEscuela(candidatos, escuelas)
	Definir esc, aux Como Entero
	Dimension esc[4]
	
	Para i = 0 Hasta 3 Con Paso 1 Hacer
		aux = 0
		Para j = 0 Hasta 3 Con Paso 1 Hacer
			esc[i] =  esc[i] + escuelas[j, i]
		Fin Para
	Fin Para
	
	Escribir "<----------------------------------------------------------------------->"
	Escribir "La escuela Nro 1 conto con ", esc[0], " votos"
	Escribir "La escuela Nro 2 conto con ", esc[1], " votos"
	Escribir "La escuela Nro 3 conto con ", esc[2], " votos"
	Escribir "La escuela Nro 4 conto con ", esc[3], " votos"
	Escribir "<----------------------------------------------------------------------->"
	
FinSubProceso

SubProceso informeFinal(candidatos, escuelas)
	
	Definir orden, votos Como Entero
	Dimension orden[5]
	Dimension votos[5]
	
	orden[0] = votosCandidatos(candidatos,escuelas, 0)
	orden[1] = votosCandidatos(candidatos,escuelas, 1)
	orden[2] = votosCandidatos(candidatos,escuelas, 2)
	orden[3] = votosCandidatos(candidatos,escuelas, 3)
	orden[4] = votosCandidatos(candidatos,escuelas, 4)
	votos[0] = votosEscuelas(candidatos,escuelas, 0)
	votos[1] = votosEscuelas(candidatos,escuelas, 1)
	votos[2] = votosEscuelas(candidatos,escuelas, 2)
	votos[3] = votosEscuelas(candidatos,escuelas, 3)
	
	Para i desde 0 hasta 4 Con Paso 1 Hacer
		
		Escribir "<----------------------------------------------------------------------->"
		Escribir "Resultados detallados para ", candidatos[i], ":"
		Para j desde 0 hasta 3 Con Paso 1 Hacer
			Escribir "Escuela ", j+1, ": ", votos[j], " votos."
			
		FinPara
		Escribir "<----------------------------------------------------------------------->"
	FinPara
	
	
FinSubProceso

Funcion votos = votosCandidatos(candidatos,escuelas, indice)
	Definir aux Como Entero
	aux = 0
	
	Para i = 0 Hasta 3 Con Paso 1 Hacer
		
		aux = aux + escuelas[indice, i]
		
	Fin Para
	
	votos = aux
	
FinFuncion

Funcion votos = votosEscuelas(candidatos,escuelas, indice)
	Definir aux Como Entero
	aux = 0
	
	Para i = 0 Hasta 3 Con Paso 1 Hacer
		
		aux = aux + escuelas[i, indice]
		
	Fin Para
	
	votos = aux
	
FinFuncion










