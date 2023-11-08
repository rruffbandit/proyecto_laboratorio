//se encarga de contar los 0 de una matriz si los 0 son iguales a 0, se pierde
subproceso return <- numerodenaves(matriz,f,c)
	definir i,j como enteros;
	para i <- 1 hasta f con paso 1 Hacer
		para j <- 1 hasta c con paso 1 Hacer
			si(matriz[i,j] = "0") Entonces
				contador <- contador + 1;
			FinSi
		FinPara
	FinPara
	return <- contador;
FinSubProceso
//actualiza la matriz con nuevos valores, los 'h' o 'm'
subproceso actulizaMatriz(matriz,f,c,hom,f_c,c_c)
	definir i,j como enteros;
	para i <- 1 hasta f con paso 1 Hacer
		para j <-1 hasta c con paso 1 Hacer
			si(i=f_c Y j=c_c) Entonces
				si(hom = verdadero) Entonces
					matriz[f_c,c_c] <- "H";
				SiNo
					matriz[f_c,c_c] <- "M";
				FinSi
			FinSi
		FinPara
	FinPara
FinSubProceso

subproceso return <- hitormiss(matriz, fil, col, fil_coord,col_coord)
	definir hit Como Logico;
	definir i,j como enteros;
	para i <- 1 hasta fil con paso 1 Hacer
		para j <-1 hasta col con paso 1 Hacer
			si(i=fil_coord Y j=col_coord) Entonces
				si(matriz[fil_coord,col_coord] = "0") Entonces
					 hit <- verdadero;
				SiNo
					 hit <- falso;
				FinSi
			FinSi
		FinPara
	FinPara
	return <- hit;
FinSubProceso

SubProceso llenadoMatriz (matriz, f,c,num,rand)
	definir j,i, f_1,c_1 Como Entero;
	segun rand Hacer
		1:
			repetir
				f_1 <- azar(f)+1;
				c_1 <- azar(c)+1;
					para i <- 1 hasta f con paso 1 Hacer
						para j <- 1 hasta c con paso 1 Hacer
							si( i = f_1 Y j = c_1) Entonces
								si(matriz[f_1,c_1] = "*")Entonces
									matriz[f_1,c_1] <- "0";
										num <- num - 1;
								FinSi
							FinSi
						FinPara
					FinPara
				Hasta Que num = 0
		2:
					repetir
						escribir "indique las coordenadas, donde quiere poner las naves";
						escribir "fila";
						leer fila_tab;
						escribir "columna";
						leer col_tab;
						para i <- 1 hasta f con paso 1 Hacer
							para j <- 1 hasta c con paso 1 Hacer
								si( i = fila_tab Y j = col_tab) Entonces
									si(matriz[fila_tab,col_tab] <> "*") Entonces
										escribir "uy, ahi no se puede ¡ya tiene una nave!";
									SiNo
										matriz[fila_tab,col_tab] <- "0";
										num <- num - 1;
										para i<- 1 hasta f con paso 1 Hacer //imprime :)
											para j <- 1 hasta c con paso 1 Hacer
												escribir  sin saltar "[ ", matriz[i,j] ," ]";
											FinPara
											escribir " ";
										FinPara
										
									FinSi
									
								FinSi
								
							FinPara
							
						FinPara
						escribir "numero de naves restantes: ",num;
					Hasta Que num = 0;
	FinSegun
	
FinSubProceso
Algoritmo batallaNaval
	definir i,j como entero;
	escribir"deeeerp";
	escribir "                                              _______   ________   _________  ________   __       __       ________                      "
	escribir "                                            /_______/\ /_______/\ /________/\/_______/\ /_/\     /_/\     /_______/\                     "
	escribir "                                            \::: _  \ \\::: _  \ \\__.::.__\/\::: _  \ \\:\ \    \:\ \    \::: _  \ \                    "
	escribir "                                             \::(_)  \/_\::(_)  \ \  \::\ \   \::(_)  \ \\:\ \    \:\ \    \::(_)  \ \                   "
	escribir "                                              \::  _  \ \\:: __  \ \  \::\ \   \:: __  \ \\:\ \____\:\ \____\:: __  \ \                  "
	escribir "                                               \::(_)  \ \\:.\ \  \ \  \::\ \   \:.\ \  \ \\:\/___/\\:\/___/\\:.\ \  \ \                 "
	escribir "                                               *\_______\/ \__\/\__\/   \__\/    \__\/\__\/ \_____\/ \_____\/ \__\/\__\/                 "
	escribir "                                             ______   ______   ______   ________   ______    ________  ________   __                     "
	escribir "                                            /_____/\ /_____/\ /_____/\ /_______/\ /_____/\  /_______/\/_______/\ /_/\                    "
	Escribir "                                            \::::_\/_\::::_\/_\:::_ \ \\::: _  \ \\:::__\/  \__.::._\/\::: _  \ \\:\ \                   "
	Escribir "                                             \:\/___/\\:\/___/\\:(_) \ \\::(_)  \ \\:\ \  __   \::\ \  \::(_)  \ \\:\ \                  "
	Escribir "                                              \::___\/_\_::._\:\\: ___\/ \:: __  \ \\:\ \/_/\  _\::\ \__\:: __  \ \\:\ \____             "
	Escribir "                                               \:\____/\ /____\:\\ \ \    \:.\ \  \ \\:\_\ \ \/__\::\__/\\:.\ \  \ \\:\/___/\            "
	escribir "                                                \_____\/ \_____\/ \_\/     \__\/\__\/ \_____\/\________\/ \__\/\__\/ \_____\/            "
	
	
		repetir
			escribir "ingrese el numero de filas para la matriz";
			leer f;
			escribir "ingrese el numero de columnas para la matriz";
			leer c;
		Hasta Que f >= 5 Y c >= 5 
			dimension matriz[f,c]; //la matriz queda definida por el usuario
			dimension matriz_w[f,c]; //se crea a su vez la matriz wario,la de nuestro contrincante
			dimension matriz_m[f,c]; // y tambien la matriz de mostrado, esta tiene H = hit o M = miss
			para i <- 1 hasta f con paso 1 Hacer
				para j <- 1 hasta c con paso 1 Hacer
					escribir Sin Saltar"[",matriz[i,j],"]"; 
				FinPara
				escribir "";
			FinPara
		escribir "se procederá a llenar el tablero de estrellas";
		para i <- 1 hasta f con paso 1 Hacer
			para j <- 1 hasta c con paso 1 Hacer
				matriz[i,j] <- "*";  //nuestra matriz
				matriz_w[i,j] <- "*"; //la matriz del contrincante se llena de estrellas
				matriz_m[i,j] <- "*"; //la matriz del tablero
			FinPara
		FinPara
		
		filaporcolumnas <- f*c; //fila * columna
		numero_naves <- trunc(filaporcolumnas/10);
		escribir "el numero de naves disponible segun el tablero, es de ",numero_naves;
		repetir
			escribir "¿le gustaria que las naves se organicen aleaoriamente en el tablero?";
			escribir "1_Si";
			escribir "2_No";
			leer resp_aleatorio;
		Hasta Que resp_aleatorio = 1 o resp_aleatorio = 2
		
		
		llenadoMatriz(matriz, f ,c ,numero_naves,resp_aleatorio);
		llenadoMatriz(matriz_w, f ,c ,numero_naves,1); //aquis
		esperar 2 segundos;
		Borrar Pantalla;
		escribir "la defensa está lista";
		escribir "¡¡el bando enemigo se acerca!!";
		
		repetir
			
			escribir "v-----  su tablero  -----v";
			para i<- 1 hasta f con paso 1 Hacer //imprime :)
				para j <- 1 hasta c con paso 1 Hacer
					escribir  sin saltar "[ ", matriz[i,j] ," ]";
				FinPara
				escribir " ";
			FinPara
			naves_a <- numerodenaves(matriz,f,c);
			escribir "numero de naves : ",naves_a;
			
			escribir "para atacar ingrese una coordenada";
			Repetir
				escribir "n° de Fila";
				leer Fila;
				escribir "n° de Columna";
				leer colum;
			Hasta Que fila <= f Y colum <= c
			
			hOm<-hitormiss(matriz_w, f, c, fila,colum);
			actulizaMatriz(matriz_m,f,c,hOm,fila,colum);
			actulizaMatriz(matriz_w,f,c,hOm,fila,colum);
			
			Borrar Pantalla;
			escribir "v---- tablero enemigo ---v";
			para i<- 1 hasta f con paso 1 Hacer //imprime :)
				para j <- 1 hasta c con paso 1 Hacer
					escribir  sin saltar "[ ", matriz_m[i,j] ," ]";
				FinPara
				escribir " ";
			FinPara
			
			naves_b<- numerodenaves(matriz_w,f,c);
			escribir "numero de naves : ",naves_b;
			
			fila <- azar(f)+1;
			colum <- azar(c)+1;
			hOm<-hitormiss(matriz, f, c, fila,colum);
			actulizaMatriz(matriz,f,c,hOm,fila,colum);
			
		Hasta Que naves_a = 0 O naves_b = 0
		
	
FinAlgoritmo
