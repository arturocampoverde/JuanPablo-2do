class SessionsController < ApplicationController
   
    def new    
    end
    
    def index
    end

     
     
  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      if user.usu_estado == "A"
        @periodo_actual = Periodo.last()
        matricula = Matricula.where(:persona_id => current_user.persona_id).last()
        @matr_enc = "no"
        if matricula.present? and matricula.curso.periodo.id == @periodo_actual.id #and user.has_role? :alumno
           @matr_enc = "yes"
        end
      else
        flash.now.alert = "USUARIO INACTIVO"
      render :new
      end
    else
      flash.now.alert = "CONTRASENA INCORRECTA"
      render :new
    end
#  if user.has_role? :admin
#    redirect_to asignaturas_menu_principal_admin_path 
#    else
#      
#    if user.has_role? :alumno
#    redirect_to matriculasacademicas_menu_principal_alumno_path
#    else
#      
#    if user.has_role? :profesor
#    redirect_to cursosrealizados_menu_principal_profesor_path
#    end
#    end
#  end
 end
 
  
  
#  def create
#    user = login(params[:username], params[:password], params[:remember_me])
#    if user
#      @periodo_actual = Periodo.last()
#      matricula = Matricula.where(:persona_id => current_user.persona_id).last()
#      @matr_enc = "no"
#      if matricula
#         @matr_enc = "yes"
#      end
#      
#    else
#      flash.now.alert = "CONTRASEÑA INCORRECTA"
#      render :new
#    end
##  if user.has_role? :admin
##    redirect_to asignaturas_menu_principal_admin_path 
##    else
##      
##    if user.has_role? :alumno
##    redirect_to matriculasacademicas_menu_principal_alumno_path
##    else
##      
##    if user.has_role? :profesor
##    redirect_to cursosrealizados_menu_principal_profesor_path
##    end
##    end
##  end
# end 
#  
     
     

    def destroy
    logout
    redirect_to root_url, :notice => ""
    end
end

  
  
  
  
#  user = login(params[:username], params[:password], params[:remember_me])
#if user
#redirect_back_or_to root_url, :notice => "Logged in!"
#else
#flash.now.alert = "Email or password was invalid"
#render :new
#end