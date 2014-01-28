//    $(function(){
//        $(".validar").keydown(function(event){
//            if(event.keyCode < 48 || event.keyCode > 57)
//            {
//                return false
//            }                        
//        });        
//    });



    $(".formulario").submit(function () {  
        if($("#telefono").val().length < 9) {  
            alert("El teléfono debe tener 9 caracteres. Ej. 666112233");  
            return false;  
        }  
        return false;  
    });  