Proceso  TUP5PI2023GRUPO1
	
	Definir clientes Como Caracter
	Dimension clientes[20,4]
	Definir articulos Como Caracter
	Dimension articulos[50,3]
	Definir menu Como Entero
	Definir val Como Caracter
	carga_datos_articulos(articulos)//carga los articulos automaticamente
	reinicio_base_clientes(clientes)//limpia la base de datos al inicio del programa
	Repetir
		//Limpiar Pantalla
		Escribir "1 - Cargar cliente"
		Escribir "2 - Buscar clientes"
		Escribir "3 - Buscar articulos"
		Escribir "4 - Ordenar clientes"
		Escribir "5 - Listado clientes"
		Escribir "6 - Listado articulos"
		Escribir "7 - Salir"
		Escribir " "
		Escribir "Elija una opcion"
		leer menu
		Segun menu
			1:
				carga_datos_clientes(clientes)
			2:
				busqueda_clientes_dni(clientes)
			3:
				//proceso_busqueda_articulos_codigo
			4:
				ordenamiento_clientes_apellido(clientes)
			5:
				//proceso_listado_clientes_apellido
			6:
				//proceso_listado_articulos_nombre
			7:
				Escribir "Esta seguro que desea salir? (S/N)"
				leer val
				si val == "S" o val == "s" Entonces
					Escribir "Gracias por usar el sistema"
				SiNo
					menu = -1
				FinSi
			De Otro Modo:
				Escribir "Ingrese una opcion correcta"
		FinSegun
	Mientras Que menu <> 7


	
	
	//proceso_carga_datos_articulos
	//proceso_busqueda_clientes_dni
	//proceso_busqueda_articulos_codigo
	//
	//proceso_listado_clientes_apellido
	//proceso_listado_articulos_nombre
	//proceso_validacion_dni
	
	
FinProceso

SubProceso carga_datos_clientes(clientes)
	para i = 0 Hasta 19 con paso 1 Hacer
		si (clientes[i,0] == " ") Entonces
			Escribir "Ingrese el DNI del cliente"
			leer clientes[i,0]
			Escribir "Ingrese el Apellido del cliente"
			leer clientes[i,1]
			Escribir "Ingrese el Nombre del cliente"
			leer clientes[i,2]
			clientes[i,3] = "ACTIVO"
			i = 20
		SiNo
			si i == 19
				Escribir "La base de datos esta completa. No se pueden ingresar mas clientes"
			FinSi
		FinSi
	FinPara
	
	
FinSubProceso
subProceso carga_datos_articulos(articulos)
	Para i = 0 Hasta 49 Con Paso 1 Hacer
		articulos[i,0] = ConvertirATexto(i+1)
		articulos[i,1] = concatenar("Articulo",articulos[i,0])
		articulos[i,2] =ConvertirATexto(Aleatorio(1,1000))
		Escribir "codigo: ", articulos[i,0] 
		Escribir "nombre: ",articulos[i,1]
		Escribir "Precio $ ",articulos[i,2] 
	FinPara
FinSubProceso

SubProceso reinicio_base_clientes(clientes)
	para i = 0 hasta 19 con paso 1 Hacer
		clientes[i,0] = " "
	FinPara
FinSubProceso

SubProceso ordenamiento_clientes_apellido(clientes)
	Definir pos_menor, dim Como Entero
	Definir nom_ape,aux Como Caracter
	Dimension nom_ape[20]
	para i = 0 Hasta 19 Con Paso 1 Hacer
		nom_ape[i] = Concatenar(clientes[i,1], clientes [i,2])
	FinPara
	dim = 19
	
	Para i<-0 Hasta dim-1 Hacer
		pos_menor <- i
		Para j <- i+1 Hasta dim Hacer
			Si nom_ape[j] < nom_ape[pos_menor] Entonces
				pos_menor <- j
			FinSi
		FinPara
		aux <- nom_ape[i]
		nom_ape[i] <- nom_ape[pos_menor]
		nom_ape[pos_menor] <- aux
	FinPara
	para i = 0 hasta 19 Con Paso 1 Hacer
		si nom_ape[i] <> " " Entonces
			Escribir "Cliente =", nom_ape[i]
		FinSi
		
	FinPara
FinSubProceso

SubProceso busqueda_clientes_dni(clientes)
	Definir dni, opc Como Caracter
	Escribir "ingrese el dni del cliente que busca:"
	leer dni
	Definir i Como Entero
	i = 0 
	
	mientras i <= 19 Hacer
		si dni == clientes[i,0] Entonces
			Escribir "Apellido: ", clientes[i,1], " Nombre: ", clientes[i,2]
			Escribir "Estado: ", clientes[i,3]
			i = 21
		SiNo
			si i == 19 Entonces
				Escribir "El DNI buscado no corresponde a un cliente"
				Escribir "Desea dar de alta este cliente? (S/N)"
				leer opc
				si opc == "S" o opc == "s" Entonces
					carga_datos_clientes(clientes)
				FinSi
			FinSi
		FinSi
		i = i + 1
		
	FinMientras
FinSubProceso
	