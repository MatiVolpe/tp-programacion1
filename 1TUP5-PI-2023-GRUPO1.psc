Proceso  TUP5PI2023GRUPO1
	
	mensaje_bienvenida
	Definir clientes Como Caracter
	Dimension clientes[20,4]
	Definir articulos Como Caracter
	Dimension articulos[30,3]
	carga_datos_articulos(articulos)//carga los articulos automaticamente
	reinicio_base_clientes(clientes)//limpia la base de datos de clientes al inicio del programa
	base_datos_clientes(clientes)//carga base de datos de clientes
	
	menu_empresa(clientes,articulos)
	

FinProceso

SubProceso carga_datos_clientes(clientes)
	Definir num, dni, rep Como Entero
	num = validar_espacio(clientes) //se fija si hay lugar en la base, si no hay lugar retorna -1, si hay lugar te da la ultima posicion(por eso guardo en una variable el resultado de la funcion)
	si (num == -1) Entonces
		Escribir "La base de datos esta completa. No se pueden ingresar mas clientes"
	SiNo
		Repetir
			Limpiar Pantalla
			Escribir "Ingrese el DNI del cliente"
			leer dni
			Escribir "Procesando..."
			Esperar 1 Segundos			
		Mientras Que (validar_dni(dni) <> 1)
		rep = validar_repetido(dni, clientes) //se fija que el dni no se repita, si no se repite retorna 0 y si se repite retorna la posicion
		si (rep == 0) Entonces
			clientes[num,0] = ConvertirATexto(dni)
			Escribir "Ingrese el Apellido del cliente"
			leer clientes[num,1]
			Escribir "Ingrese el Nombre del cliente"
			leer clientes[num,2]
			clientes[num,3] = "ACTIVO"
			Escribir "El cliente se guardo con exito."
			Esperar Tecla
		SiNo
			Escribir "El cliente ya existe. Desea modificarlo? (S/N)"
			Escribir "DNI: ", clientes[rep,0]," --- ", clientes[rep,1]," " clientes[rep,2], ", Estado: ", clientes[rep,3]
			leer respuesta
			si respuesta == "S" o respuesta == "s" Entonces
				modificar_cliente(dni, clientes, rep )
			SiNo
				Escribir "El cliente no se modificara"	
				Esperar Tecla
			FinSi		
		FinSi
	FinSi
	

FinSubProceso

Funcion espacio <- validar_espacio(clientes)
	para i = 0 Hasta 19 Con Paso 1 Hacer
		si (clientes[i,0] == " ") Entonces
			espacio = i
			i = 20
		SiNo
			si i == 19 Entonces
				espacio = -1
			FinSi
		FinSi
	FinPara
FinFuncion

Funcion dni_ok <- validar_dni(dni)
	Definir respuesta Como Caracter
	si (dni > 1000000 y dni < 99999999) Entonces
		dni_ok = 1
	SiNo
		Escribir "El numero ingresado es incorrecto."
		Escribir "Intente nuevamente"
		Esperar Tecla
		dni_ok = 0
	FinSi
FinFuncion

Funcion repetido <- validar_repetido(dni, clientes)	
	para j = 0 hasta 19 Con Paso 1 Hacer
		si (clientes[j,0] == ConvertirATexto(dni)) Entonces
			repetido = j
			j = 20
		SiNo
			repetido = 0
		FinSi
	FinPara
FinFuncion

SubProceso modificar_cliente(dni, clientes, i)
	clientes[i,0] = ConvertirATexto(dni)
	Escribir "Ingrese el Apellido del cliente"
	leer clientes[i,1]
	Escribir "Ingrese el Nombre del cliente"
	leer clientes[i,2]
	clientes[i,3] = "ACTIVO"	
	Escribir "El cliente se modificó con exito."
	Esperar Tecla
FinSubProceso

SubProceso reinicio_base_clientes(clientes)
	para i = 0 hasta 19 con paso 1 Hacer
		clientes[i,0] = " "
	FinPara
FinSubProceso

//proceso_listado_clientes_apellido
SubProceso ordenamiento_clientes_apellido(clientes)
	
	Limpiar Pantalla
	Definir pos_menor, dim, i, j Como Entero
	Definir nom_ape,aux Como Caracter
	Dimension nom_ape[20]
	para i = 0 Hasta 19 Con Paso 1 Hacer
		nom_ape[i] = Concatenar(clientes[i,1]," ")
		nom_ape[i] = Concatenar(nom_ape[i], clientes [i,2])
	FinPara
	dim = 19
	
	Para i<-0 Hasta dim-1 Hacer
		pos_menor <- i
		Para j <- i+1 Hasta dim Hacer
			Si Mayusculas(nom_ape[j]) < Mayusculas(nom_ape[pos_menor]) Entonces
				pos_menor <- j
			FinSi
		FinPara
		aux <- nom_ape[i]
		nom_ape[i] <- nom_ape[pos_menor]
		nom_ape[pos_menor] <- aux
	FinPara
	Escribir "A continuación se muestran los clientes ordenados por apellido"
	Escribir " "
	Esperar 1 Segundos
	Escribir "<---------------------------------------------------->"
	para i = 0 hasta 19 Con Paso 1 Hacer
		si nom_ape[i] <> " " Entonces
			Escribir "Cliente = ", nom_ape[i]
		FinSi		
	FinPara
	Escribir "<---------------------------------------------------->"
	Esperar Tecla
FinSubProceso
//proceso_busqueda_clientes_dni
SubProceso busqueda_clientes_dni(clientes)
	Limpiar Pantalla
	Definir i Como Entero
	Definir dni, opc Como Caracter
	Escribir "Ingrese el DNI del cliente a buscar:"
	leer dni
	i = 0 
	
	mientras i <= 19 Hacer
		si dni == clientes[i,0] Entonces
			Escribir "Cliente encontrado"
			Escribir "Apellido: ", clientes[i,1], " Nombre: ", clientes[i,2]
			Escribir "Estado: ", clientes[i,3]
			i = 21
			Esperar Tecla
		SiNo
			si i == 19 Entonces
				Escribir "El DNI buscado no corresponde a un cliente"
				Escribir "Desea dar de alta este cliente? (S/N)"
				leer opc
				si opc == "S" o opc == "s" Entonces
					carga_datos_clientes(clientes)
				FinSi
				esperar 1 Segundos
			FinSi
		FinSi
		i = i + 1
		
	FinMientras
FinSubProceso


SubProceso ordenamiento_articulos_cod(articulos)
	Definir pos_menor, i, j Como Entero
	Definir aux Como Caracter
	Dimension aux[3]
	
	Para i=0 Hasta 28 Hacer
		pos_menor = i
		Para j=i+1 Hasta 29 Hacer
			Si articulos[j,0] < articulos[pos_menor,0] Entonces
				pos_menor <- j
			FinSi
		FinPara
		aux[0] <- articulos[i,0]
		aux[1] <- articulos[i,1]
		aux[2] <- articulos[i,2]
		articulos[i,0] <- articulos[pos_menor,0]
		articulos[i,1] <- articulos[pos_menor,1]
		articulos[i,2] <- articulos[pos_menor,2]
		articulos[pos_menor,0] <- aux[0]
		articulos[pos_menor,1] <- aux[1]
		articulos[pos_menor,2] <- aux[2]
	FinPara
FinSubProceso

//proceso_busqueda_articulos_codigo
SubProceso busqueda_articulos_codigo(articulos)
	ordenamiento_articulos_cod(articulos)
	Definir cod, inicio, final, medio Como Entero
	Definir encontrado Como Logico
	Limpiar Pantalla
	Escribir "Ingrese el codigo del articulo que desea encontrar"
	Leer cod
	inicio = 0
	final = 29
	encontrado = Falso
	
	Mientras inicio <= final y !encontrado Hacer
		medio = trunc((inicio + final)/2)
		si (articulos[medio,0] == ConvertirATexto(cod))
			encontrado = Verdadero
		SiNo
			si ConvertirANumero(articulos[medio,0]) < cod
				inicio = medio + 1
			SiNo
				final = medio - 1
			FinSi
		FinSi
	FinMientras
	
	si encontrado Entonces
		Escribir "Codigo encontrado, el articulo es:"
		Escribir "Codigo: ", articulos[medio,0],"--- ", articulos[medio,1]," --- $", articulos[medio,2]
	SiNo
		Escribir "El codigo ingresado no corresponde a ningun articulo"
	FinSi
	Esperar Tecla
FinSubProceso


SubProceso listado_clientes_apellido(clientes)
	Definir i Como Entero
	Limpiar Pantalla
	Escribir "Listado de clientes"
	esperar 1 Segundos
	Escribir " "
	Escribir "<---------------------------------------------------->"
	Para i=0 Hasta 19 Hacer
		Si clientes[i,0] <> " " Entonces
			
			Escribir "DNI: ", clientes[i,0]," --- ", clientes[i,1]," " clientes[i,2], ", Estado: ", clientes[i,3] Sin Saltar
			Escribir  " "
		Fin Si
	FinPara
	Escribir "<---------------------------------------------------->"
	Esperar Tecla
FinSubProceso

SubProceso mostrar_articulos(articulos)
	Limpiar Pantalla
	Escribir "A continuación se muestran los articulos"
	Escribir " "
	Esperar 1 Segundos
	Escribir "<---------------------------------------------------->"

	Para i = 0 Hasta 29 Con Paso 1 Hacer
		Escribir "Codigo: ", articulos[i,0],"--- ", articulos[i,1]," --- $", articulos[i,2]
	Fin Para
	Escribir "<---------------------------------------------------->"
	Esperar Tecla

	
FinSubProceso

//Subproceso para cargar "Base de datos" de clientes
SubProceso base_datos_clientes(clientes)
	
	clientes[0,0] = "19461236"
	clientes[0,1] = "Perez"
	clientes[0,2] = "Carlos"
	clientes[0,3] = "ACTIVO"
	clientes[1,0] = "25986314"
	clientes[1,1] = "Fontana"
	clientes[1,2] = "Hugo"
	clientes[1,3] = "ACTIVO"
	clientes[2,0] = "17896254"
	clientes[2,1] = "Acevedo"
	clientes[2,2] = "Mario"
	clientes[2,3] = "ACTIVO"
	clientes[3,0] = "32865112"
	clientes[3,1] = "Acevedo"
	clientes[3,2] = "Agustin"
	clientes[3,3] = "ACTIVO"
	clientes[4,0] = "24369522"
	clientes[4,1] = "Ocampo"
	clientes[4,2] = "Maria"
	clientes[4,3] = "ACTIVO"
	clientes[5,0] = "28961566"
	clientes[5,1] = "Dorrego"
	clientes[5,2] = "Juliana"
	clientes[5,3] = "ACTIVO"
	clientes[6,0] = "26745336"
	clientes[6,1] = "Moyano"
	clientes[6,2] = "Juan Carlos"
	clientes[6,3] = "ACTIVO"
	clientes[7,0] = "41036225"
	clientes[7,1] = "Flores"
	clientes[7,2] = "Mariana"
	clientes[7,3] = "ACTIVO"
	clientes[8,0] = "27538826"
	clientes[8,1] = "Caputto"
	clientes[8,2] = "Marcos"
	clientes[8,3] = "ACTIVO"
	clientes[9,0] = "31523728"
	clientes[9,1] = "Rivas"
	clientes[9,2] = "Erica"
	clientes[9,3] = "ACTIVO"
FinSubProceso

//proceso_carga_datos_articulos
subProceso carga_datos_articulos(articulos)
	articulos[0,0] = "2094"
	articulos[0,1] = "PC1832 + TECLADO"
	articulos[0,2] = "256.04"
	articulos[1,0] = "4584"
	articulos[1,1] = "PC1832 + TECLADO PC155S5 + PC5002C GAB METAL"
	articulos[1,2] = "225.50"
	articulos[2,0] = "3558"
	articulos[2,1] = "PC1832/PK5500"
	articulos[2,2] = "324.54"
	articulos[3,0] = "2075"
	articulos[3,1] = "PC183/2CLC14ARG"
	articulos[3,2] = "228.50"
	articulos[4,0] = "4753"
	articulos[4,1] = "PC1832 + TECLADO PK5501 + GAB + TRAF"
	articulos[4,2] = "244.00"
	articulos[5,0] = "1581"
	articulos[5,1] = "PC1832 PLACA PCB"
	articulos[5,2] = "147.40"
	articulos[6,0] = "1649"
	articulos[6,1] = "PANEL 6 ZONAS S/TEC S/TRAF S/GAB"
	articulos[6,2] = "100.00"
	articulos[7,0] = "9935"
	articulos[7,1] = "PANEL 8 ZONAS CON GABINETE S/TECLADO"
	articulos[7,2] = "77.50"
	articulos[8,0] = "3077"
	articulos[8,1] = "PANEL 8 ZONAS HS2032 + TECLADO HS2 FULL + GABINETE"
	articulos[8,2] = "299.30"
	articulos[9,0] = "1883"
	articulos[9,1] = "TECLADO 100% WLS FULL ALPHA-2 VIA-PROX+TAG"
	articulos[9,2] = "128.70"
	articulos[10,0] = "2657"
	articulos[10,1] = "TECLADO ALFANUMERICO C/RX INALAMB 64ZONAS"
	articulos[10,2] = "198.20"
	articulos[11,0] = "9998"
	articulos[11,1] = "TECLADO LEDS 8 ZONAS PARA POWER SERIES"
	articulos[11,2] = "67.60"
	articulos[12,0] = "1404"
	articulos[12,1] = "LC 100 - DETECTOR PIR MASCOTAS"
	articulos[12,2] = "49.99"
	articulos[13,0] = "1872"
	articulos[13,1] = "LC-102 DETECTOR PIR DUAL + INFRARROJO"
	articulos[13,2] = "74.00"
	articulos[14,0] = "2424"
	articulos[14,1] = "DETECTOR PIR WLSS LARGO ALCANCE"
	articulos[14,2] = "72.90"
	articulos[15,0] = "2667"
	articulos[15,1] = "DETECTOR PIR EXTERIOR 180 GRADOS"
	articulos[15,2] = "257.00"
	articulos[16,0] = "2216"
	articulos[16,1] = "DETECTOR PIR EXTERIOR 180º 2 CABEZALES MOVILES"
	articulos[16,2] = "312.00"
	articulos[17,0] = "2217"
	articulos[17,1] = "DETECTOR PIR EXTERIOR 90º CABLEADO 1 CABEZAL MOVIL"
	articulos[17,2] = "238.00"
	articulos[18,0] = "3777"
	articulos[18,1] = "BARRERA 12 HACES PERFIL 100 MTRS"
	articulos[18,2] = "167.00"
	articulos[19,0] = "4828"
	articulos[19,1] = "BARRERA EXTERIOR 2 HACES 100 MTS C/7 LED SEÑAL"
	articulos[19,2] = "67.20"
	articulos[20,0] = "1458"
	articulos[20,1] = "BARRERA EXTERIOR 250M 4 HACES"
	articulos[20,2] = "317.50"
	articulos[21,0] = "5105"
	articulos[21,1] = "MAGNETICO BORNERA COLOR BLANCO"
	articulos[21,2] = "2.75"
	articulos[22,0] = "3188"
	articulos[22,1] = "MAGNETICO MARRON P/PUERTAS METALICAS 1"
	articulos[22,2] = "6.90"
	articulos[23,0] = "2263"
	articulos[23,1] = "PACK X 10 MAGN BLANCOS BORNERA"
	articulos[23,2] = "37.40"
	articulos[24,0] = "5176"
	articulos[24,1] = "DVR 16CH DAHUA"
	articulos[24,2] = "629.60"
	articulos[25,0] = "5275"
	articulos[25,1] = "DVR 32CH DAHUA"
	articulos[25,2] = "731.30"
	articulos[26,0] = "4561"
	articulos[26,1] = "CAM BULLET 2MP DAHUA"
	articulos[26,2] = "84.50"
	articulos[27,0] = "4629"
	articulos[27,1] = "CAM BULLET 2MP WIFI"
	articulos[27,2] = "120.00"
	articulos[28,0] = "5355"
	articulos[28,1] = "CAM BULLET 4MP C/PANEL SOLAR"
	articulos[28,2] = "576.50"
	articulos[29,0] = "3039"
	articulos[29,1] = "CAM IP WIFI INT"
	articulos[29,2] = "86.25"
	
	
FinSubProceso

SubProceso mensaje_bienvenida
	Limpiar Pantalla
	Escribir "------------------------------------------------------------------------"
	Escribir "  Bienvenido al software de gestion de empresa de seguridad electronica "
	Escribir "------------------------------------------------------------------------"
	Esperar Tecla
FinSubProceso

SubProceso menu_empresa(clientes, articulos)
	Definir pos_codigo Como Entero
	Definir menu, val Como Caracter
	Repetir
		Limpiar Pantalla
		Escribir "<--------------------->"
		Escribir "1 - Cargar cliente"
		Escribir "2 - Buscar clientes"
		Escribir "3 - Buscar articulos"
		Escribir "4 - Ordenar clientes"
		Escribir "5 - Listado clientes"
		Escribir "6 - Ordenar articulos"
		Escribir "7 - Listado articulos"
		Escribir "8 - Salir"
		Escribir " "
		Escribir "Elija una opcion"
		Escribir "<--------------------->"
		leer menu
		Segun menu
			"1":
				carga_datos_clientes(clientes)
			"2":
				busqueda_clientes_dni(clientes)
			"3":
				busqueda_articulos_codigo(articulos)
			"4":
				ordenamiento_clientes_apellido(clientes)
			"5":
				listado_clientes_apellido(clientes)
			"6":
				ordenamiento_articulos_cod(articulos)
				Limpiar Pantalla
				Escribir "<---------------------------------------------------->"
				Escribir "Ordenando base de datos de articulos por codigo..."
				Esperar 2 Segundos
				Escribir "<---------------------------------------------------->"
				Escribir "Articulos ordenados con éxito."
				Esperar Tecla
			"7": 
				mostrar_articulos(articulos)	
			"8":
				Escribir "Esta seguro que desea salir? (S/N)"
				leer val
				si val == "S" o val == "s" Entonces
					Escribir "Gracias por usar el sistema"
				SiNo
					menu = "-1"
				FinSi
			De Otro Modo:
				Escribir "Ingrese una opcion correcta"
		FinSegun
	Mientras Que menu <> "8"
FinSubProceso
	