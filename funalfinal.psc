SubAlgoritmo validos(trabas,contador)
	definir i Como Entero
	para i = 1 hasta 6 con paso 1 Hacer
		si(contador[i] <> 0) Entonces
			si(contador[i] >0 Y i = 1) Entonces
				trabas[i] = i
			SiNo
				si(contador[i] > 0 Y i = 5) Entonces
					trabas[i] = i
				SiNo
					si(contador[i] > 3) Entonces
						trabas[i] = i
					FinSi
				FinSi
			
			FinSi
		FinSi
	FinPara
FinSubAlgoritmo

SubAlgoritmo puntos<- calculoScore(contador)
	definir puntos, cant Como Entero;
	puntos = 0;
	para i = 1 hasta 6 con paso 1 Hacer
		cant = contador[i]
		si(cant<3) Entonces
			si(i = 1) Entonces
				puntos = puntos + (100*cant);
			SiNo
				si(i = 5) Entonces
					puntos = puntos + (50*cant)
				FinSi
			FinSi
			
		SiNo
			si(cant>=3) Entonces
				factor = 2^(cant-3)
				si(i = 1) Entonces
					puntos = puntos +(1000*factor);
				SiNo
					puntos = puntos + (100 * factor * i)
				FinSi
			FinSi
		FinSi
	FinPara
FinSubAlgoritmo

SubAlgoritmo fncontadora(arr,contador)
	definir i, j Como Entero
	para i<- 1 hasta 6 con paso 1 Hacer
		contador[i] <- 0
	FinPara
	
	para i <- 1 hasta 6 con paso 1 Hacer
		si(arr[i] <> 0) entonces
			indice_cont = arr[i]
			contador[indice_cont] = contador[indice_cont] + 1
		FinSi
	FinPara
	
FinSubAlgoritmo

//lanza los dados distintos de 0, ya que los 0 fueron tomados
SubProceso LanzaDados(dados)
	para i <- 1 hasta 6 con paso 1 Hacer
		si(dados[i] <> 0) Entonces
			dados[i] <- azar(6)+1;
		FinSi
	FinPara
FinSubProceso

//funcion llamada para mostrar los dados! nada mas que eso jiji
SubAlgoritmo MostrarDados(dados,dadosApartados,dadosMano,puntos)
	definir i como entero
	escribir "     .-------.      .-------.      .-------.      .-------.      .-------.      .-------.  ";
	escribir "    /       /|     /       /|     /       /|     /       /|     /       /|     /       /|  ";
	escribir "   /_______/ |    /_______/ |    /_______/ |    /_______/ |    /_______/ |    /_______/ |  ";
	escribir "   |       | |    |       | |    |       | |    |       | |    |       | |    |       | |  ";
	escribir "   |   ",dados[1],"   | /    |   ",dados[2],"   | /    |   ",dados[3],"   | /    |   ",dados[4],"   | /    |   ",dados[5],"   | /    |   ",dados[6],"   | /  ";
	escribir "   |       |/     |       |/     |       |/     |       |/     |       |/     |       |/   ";
	escribir "   *-------*      *-------*      *-------*      *-------*      *-------*      *-------*    ";
	escribir "      #1             #2              #3            #4              #5            #6        ";
	escribir ""
	escribir "dados apartados : "
	para i <- 1 hasta 6 con paso 1 Hacer
		escribir sin saltar  "[",dadosApartados[i],"]";
	FinPara
	escribir ""
	escribir "dados en Mano : "
	para i <- 1 hasta 6 con paso 1 Hacer
		escribir sin saltar  "[",dadosMano[i],"]";
	FinPara
	escribir ""
	escribir "puntosss = ",puntos;
FinSubAlgoritmo

Algoritmo dados10
	definir i,j ,dados,dadosApartados,dadosMano, resp_menu,resp_dado,resp_impo como enteros;
	definir title como caracter;
	definir apartado Como Logico
	dimension contador[6]
	dimension trabas[6];
	dimension dados[6]; //los dados con los 6 valores al azar entre 1 y 6
	dimension dadosApartados[6] //dados apartados, son los que no puedes cambiar
	dimension dadosMano[6]; //estos son los dados que calculan los puntos, el alma del juego
	dimension title[10];//arr de titulo
	
	title[1] <- "                           ____                  __                          _      __          __       __       __     ";
	title[2] <-"                           /\  _`\               /\ \                       /* \   /*__`\      /*__`\   /*__`\   /*__`\   ";
	title[3] <- "                           \ \ \/\ \     __      \_\ \     ___     ____    /\_, \ /\ \/\ \    /\ \/\ \ /\ \/\ \ /\ \/\ \  ";
	title[4] <- "                            \ \ \ \ \  /*__`\    /*_` \   / __`\  /*,__\   \/_/\ \\ \ \ \ \   \ \ \ \ \\ \ \ \ \\ \ \ \ \ ";
	title[5] <-"                             \ \ \_\ \/\ \L\.\_ /\ \L\ \ /\ \L\ \/\__, `\     \ \ \\ \ \_\ \ __\ \ \_\ \\ \ \_\ \\ \ \_\ \";
	title[6] <-"                              \ \____/\ \__/.\_\\ \___,_\\ \____/\/\____/      \ \_\\ \____//\ \\ \____/ \ \____/ \ \____/";
	title[7] <-"                               \/___/  \/__/\/_/ \/__,_ / \/___/  \/___/        \/_/ \/___/ \ \/ \/___/   \/___/   \/___/ ";
	
	para i <- 1 hasta 7 con paso 1 hacer
		escribir title[i];//recorre el titulo y lo imprime
	FinPara
	
	escribir "ingrese su nombre :)";
	leer nom;
	
	escribir "bienvenid@! ",nom," a dados 10,000";
	escribir "El 10.000 es un divertido juego de 6 dados para cualquier edad."
	escribir "El objetivo es conseguir 10.000 puntos lanzando combinaciones ganadoras con los 6 dados."
	
	escribir ""
	escribir "presiona cualquier tecla para ver las reglas :)"
	esperar Tecla
	Borrar Pantalla
	
	
	escribir "                                             .-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-."
	escribir "                                             |                             R E G L A S                               |";
	escribir "                                             .-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-."
	escribir "                                              1. Lanza los seis dados."
	escribir ""
	escribir "                                              2. Reconoce los dados que te dan puntaje, bajo cada dado a un # identificador"
	escribir ""
	escribir "                                              3. Aparta los dados que quieras conservar y lanza los demas para seguir sumando puntos."
	escribir ""
	escribir "                                              4. Revisa si tienes dados de puntuacion y separa al menos uno por cada turno."
	escribir ""

	
	escribir "                                             .-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-."
	escribir "                                             |                            P U N T O S                               |";
	escribir "                                             .-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-."
	//esto ocurre una primera vez! solamente, ya que luego se llenan y vacian dentro del ciclo
	para i <- 1 hasta 6 con paso 1 Hacer
		dados[i] <- azar(6)+1;
		dadosApartados[i] <- 0;
		dadosMano[i] <- 0;
	FinPara
	
	Repetir
		para i <- 1 hasta 6 con paso 1 Hacer
			dados[i] <- azar(6)+1;
		FinPara
		puntos = 0;
		lanzaDados(dados)
		MostrarDados(dados,dadosApartados,dadosMano,puntos)
		apartado = falso
		
		fncontadora(dados,contador)
		validos(trabas,contador)   
		para i = 1 hasta 6 con paso 1 Hacer
			si(trabas[i] = 0) Entonces
				cont_ = cont_ + 1
			FinSi
		FinPara
		
		si(cont_ = 6) Entonces
			escribir "no suelen ocurrir estas cosas, eres un caso especial :p"
			lanzaDados(dados)
			MostrarDados(dados,dadosApartados,dadosMano,puntos)
		FinSi
		
		
		Repetir
			escribir "score ==> ",score,"/10,000";
			escribir ""
			escribir "1_ Aparta dados"//permite apartar los dados en dadosEnMano
			escribir "2_lanzar dados" //rueda los dados distintos de los dadosEnMano
			escribir "3_banquear puntos" //banquea los puntos de los dados en dadosEnMano
			leer resp_menu;
			
			segun resp_menu hacer
				1:	
					repetir
						//que numero de dado?
						escribir "¿Qué # de dado?"
						leer resp_dado
						//recorre el vector del 1 al 6
						para i <- 1 hasta 6 con paso 1 Hacer
							//cuando la respuesta sea igual al valor de i
							si(resp_dado == i) Entonces
								//recorre otro vector del 1 al 6
								para j <-1 hasta 6 con paso 1 Hacer
									//cuando el vector en el indice j tenga un valor en 0
									si(dadosMano[j] = 0) Entonces
										//la posicion j del vector dadomano guarda el valor de la posicion i de dados jaja un embole
										dadosMano[j] <- dados[i]
										dados[i] <- 0; //mientras que esa misma posicion de dados se pone en 0
									FinSi
								FinPara
							FinSi
						FinPara
						apartado = verdadero
						Repetir
							escribir "¿Aparta otro dado?"
							escribir "1_si"
							escribir "2_no"
							leer resp_impo
						Hasta Que resp_impo = 1 O resp_impo = 2
						
						
					Hasta Que resp_impo = 2
					fncontadora(dadosMano,contador);
					puntos<- puntos + calculoScore(contador);
					
					mostrarDados(dados,dadosApartados,dadosMano,puntos)
					
					para i = 1 hasta 6 con paso 1 Hacer
						si(dadosApartados[i] = 0) Entonces
							para j = 1 hasta 6 con paso 1 Hacer
								si(dadosMano[j] <> 0) Entonces
									dadosApartados[i] = dadosMano[j]
									dadosMano[j] = 0
									i = i +1 //fuerza la i a dar otro ciclo y guardar
								FinSi
							FinPara
						FinSi
					FinPara
					apartado = Verdadero
					
				2:Si(apartado = verdadero)entonces
					
					LanzaDados(dados);
					mostrarDados(dados,dadosApartados,dadosMano,puntos);
					fncontadora(dados,contador)
					validos(trabas,contador)  
					para i = 1 hasta 6 con paso 1 Hacer
						si(trabas[i] = 0) Entonces
							cont_ = cont_ + 1
						FinSi
					FinPara
					si(cont_ = 6) Entonces
						escribir "perdiste todos tus puntos loserr :p"
						esperar 1 Segundos
						lanzaDados(dados)
					FinSi
				SiNo
					escribir "tienes que apartar minimo un dado!!";
				FinSi
				
				apartado<-falso;
				
				3:si(apartado = verdadero) entonces
					escribir "¡puntos banqueados!";
					
				SiNo
					escribir "¡¡tienes que apartar minimo un dado!!";
				FinSi
			FinSegun
			
		Hasta Que resp_menu = 3 Y apartado = verdadero
		score = score + puntos;
		para i <- 1 hasta 6 con paso 1 Hacer
			dadosApartados[i] <- 0;
			dadosMano[i] <- 0;
		FinPara
		
	Hasta Que score = 10000;
	
	
FinAlgoritmo
