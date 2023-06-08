Proceso  TUP5PI2023GRUPO1
	
	Definir clientes Como Caracter
	Dimension clientes[20,4]
	Definir articulos Como Caracter
	Dimension articulos[50,3]
	
	carga_datos_articulos(articulos)
	Limpiar Pantalla
	Escribir "1 - Cargar clientes"
	Escribir "2 - Buscar clientes"
	Escribir "3 - Buscar articulos"
	Escribir "4 - Ordenar clientea"
	Escribir "5 - Listado clientes"
	Escribir "6 - Listado articulos"
	Escribir "7 - Salir"

	
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
	