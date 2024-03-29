
var Conexion=false; // Variable que manipula la conexion.

// funcion que realiza la conexion con el objeto XMLHTTP...
function Conectar()
{
	if(window.XMLHttpRequest)
		Conexion=new XMLHttpRequest(); //mozilla
	else if(window.ActiveXObject)
		Conexion=new ActiveXObject("Microsoft.XMLHTTP"); //microsoft
}

function Contenido(idContenido)
{
	/* readyState devuelve el estado de la conexion. puede valer:
	 *	0- No inicializado (Es el valor inicial de readyState)
	 *	1- Abierto (El m�todo "open" ha tenido �xito)
	 *	2- Enviado (Se ha completado la solicitud pero ningun dato ha sido recibido todav�a)
	 *	3- Recibiendo
	 *	4- Respuesta completa (Todos los datos han sido recibidos)
	 */

	// En espera del valor 4
	if(Conexion.readyState!=4) return;
	/* status: contiene un codigo enviado por el servidor
	 *	200-Completado con �xito
	 *	404-No se encontr� URL
	 *	414-Los valores pasados por GET superan los 512
	 * statusText: contiene el texto del estado
	 */
	if(Conexion.status==200) // Si conexion HTTP es buena !!!
	{
		/* Modificamos el identificador temp con el valor recibido por la consulta
		 *	Podemos recibir diferentes tipos de datos:
		 *	responseText-Datos devueltos por el servidor en formato cadena
		 *	responseXML-Datos devueltos por el servidor en forma de documento XML
		 */
		document.getElementById(idContenido).innerHTML=Conexion.responseText;
	}else{
		document.getElementById(idContenido).innerHTML=Conexion.status+"-"+Conexion.statusText;
	}
	
	Conexion=false;
}

function Solicitud(Servidor,idContenido)
{
	// Si ya esta conectado, cancela la solicitud en espera de que termine
	if(Conexion) return; // Previene uso repetido del boton.
	
	// Realiza la conexion
	Conectar();
	
	// Si la conexion es correcta...
	if(Conexion)
	{
		/* Preparamos una conexion con el servidor:
		 *	POST|GET - determina como se envian los datos al servidor
		 *	true - No sincronizado. Ello significa que la p�gina WEB no es interferida en su funcionamiento
		 *	por la respuesta del servidor. El usuario puede continuar usando la p�gina mientras el servidor
		 *	retorna una respuesta que la actualizar�, usualmente, en forma parcial.
		 *	false - Sincronizado */
		Conexion.open("GET",Servidor,true);

		// Cada vez que el estado de la conexi�n (readyState) cambie se ejecutara el contenido de esta "funcion()"
		Conexion.onreadystatechange=function()
		{
			Contenido(idContenido);
		}
		
		/* Realiza la solicitud al servidor. Puede enviar una cadena de caracteres, o un objeto del tipo XML
		 * Si no deseamos enviar ningun valor, enviamos null */
		Conexion.send(null);
	}else
		document.getElementById(idContenido).innerHTML="No disponible";
}


function isNumberKey(evt) //SOLO LETRAS
     {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57) || charCode ==8)
        return true
        return false;
     }
 
 
  function ValidNum(e) // SOLO NUMEROS
   { 
       var tecla= document.all ? tecla = e.keyCode : tecla = e.which;
       return ((tecla > 47 && tecla < 58) || tecla == 46 || tecla ==8 ||tecla==45);
   }
 





window.onload=function()
{
	Solicitud("menu_principal/fondo.html","pagina"); // Inicializamos con la primera pagina
        
}





