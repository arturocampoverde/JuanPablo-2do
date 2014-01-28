class DatosalumnosController < ApplicationController
  
   before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PONGA "SIGN_UP"   
   before_filter :authenticated_alum
  
  
  
   def new    
    @user =   User.new
    @person = Persona.new          
    @tipo = Tipo.new
   end
    
     
     
        def index
         @person = Persona.joins(:users).where(:id => current_user.persona.id)
         @users = User.scoped_by_email current_user.email
         @repre = Persona.joins(:representantes).where(:representantes => {:estudiante_id => current_user.persona.id})
#         respond_to do |format|
#         format.html
#         format.xml
#          end
         end   
         
      
   def edit
    @person = Persona.joins(:users).where(:id => current_user.persona.id).first
    @users= User.find_all_by_email current_user.email
    @repre = Persona.joins(:representantes).where(:representantes => {:estudiante_id => current_user.persona.id}).first
   end
    
       
   def update
     @person = Persona.find_by_id(params[:person_id])
     @person.update_attributes(pers_direccion: params[:pers_direccion] , pers_telefono1: params[:pers_telefono1], pers_telefono2: params[:pers_telefono2])

     @repre = Persona.find_by_id(params[:repre_id])
     @repre.update_attributes(pers_nombre: params[:repre_nombre], pers_apellido: params[:repre_apellido], pers_direccion: params[:repre_direccion] , pers_telefono1: params[:repre_telefono1], pers_telefono2: params[:repre_telefono2])
     redirect_to matriculasacademicas_menu_principal_alumno_path, :notice => "USUARIO EDITADO CON EXITO"
   end

end
