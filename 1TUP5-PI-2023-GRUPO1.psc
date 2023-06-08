Proceso  TUP5PI2023GRUPO1
	
	Definir clientes Como Caracter
	Dimension clientes[20,4]
	Definir articulos Como Caracter
	Dimension articulos[50,3]
	Definir menu Como Entero
	Definir val Como Caracter
	carga_datos_articulos(articulos)
	Repetir
		//Limpiar Pantalla
		Escribir "1 - Cargar cliente"
		Escribir "2 - Buscar clientes"
		Escribir "3 - Buscar articulos"
		Escribir "4 - Ordenar clientea"
		Escribir "5 - Listado clientes"
		Escribir "6 - Listado articulos"
		Escribir "7 - Salir"
		Escribir " "
		Escribir "Elija una opcion"
		leer menu
		Segun menu
			1:
				//proceso_carga_datos_clientes
			2:
				//proceso_busqueda_clientes_dni
			3:
				//proceso_busqueda_articulos_codigo
			4:
				//proceso_ordenamiento_clientes_apellido
			5:
				//proceso_listado_clientes_apellido
			6:
				//proceso_listado_articulos_nombre
			7:
				Escribir "Esta seguro que desea salir? (S/N)"
				leer val
				si val == "S" Entonces
					Escribir "Gracias por usar el sistema"
				SiNo
					menu = 8
				FinSi
			De Otro Modo:
				Escribir "Ingrese una opcion correcta"
		FinSegun
	Mientras Que menu <> 7


	
	//proceso_carga_datos_clientes
	//proceso_carga_datos_articulos
	//proceso_busqueda_clientes_dni
	//proceso_busqueda_articulos_codigo
	//proceso_ordenamiento_clientes_apellido
	//proceso_listado_clientes_apellido
	//proceso_listado_articulos_nombre
	//proceso_validacion_dni
	
	
FinProceso

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
	