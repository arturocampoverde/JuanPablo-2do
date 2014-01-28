  class UsersController < ApplicationController  
  
#    before_filter :authenticate, :only => [:index, :edit, :update, :destroy, :show]
#    before_filter :correct_user, :only => [:edit, :update, :show, ]      
#    before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PONGA "SIGN_UP"
#    before_filter :authenticated_admin
#  
  
    
    
  
    def new    
    @user =   User.new
    @person = Persona.new          
    @tipo = Tipo.new
    @estudiante = params[:estudiante]
    end
     
    
    
    def create
    @person = Persona.new(params[:persona])
    @repre = Persona.new(params[:repre])
    @tipo = Tipo.new(params[:tipo])          
    @user = @person.users.build(params[:user])
    @tipo = @person.tipos.build(params[:tipo]) 
    @tabla_repre = Representante.new(params[:representante])
    #creamos tipo para almacenar su descripcion
    @estudiante = params[:estudiante]
      
    
    #@user = User.new(params[:user])
    #@person = @user.personas.build(params[:persona])
    if @person.save and @tipo.save
      if @tipo.tip_descrip == "ALUMNO"
        @repre.save
        @tabla_repre.repre_estado = "R"
        @tabla_repre.estudiante_id = @person.id
        @tabla_repre.persona_id = @repre.id
        @tabla_repre.save
        if Role.find_by_name("alumno") == nil
          Role.create(name: "alumno")
        end
        rol = Role.find_by_name("alumno")
        UsersRole.create(user_id: @user.id, role_id: rol.id)
      end

      if @tipo.tip_descrip == "PROFESOR"
        if Role.find_by_name("profesor") == nil
          Role.create(name: "profesor")
        end
        rol = Role.find_by_name("profesor")
        UsersRole.create(user_id: @user.id, role_id: rol.id)
      end

      if @tipo.tip_descrip == "SECRETARIA"
        if Role.find_by_name("secretaria") == nil
          Role.create(name: "secretaria")
        end
        rol = Role.find_by_name("secretaria")
        UsersRole.create(user_id: @user.id, role_id: rol.id)
      end
      redirect_to asignaturas_menu_principal_admin_path, :notice => "USUARIO CREADO CON EXITO"
    else
    render :new
    end
    end
    
#    
#         def index
#         @person = Persona.joins(:users).where(:id => current_user.persona.id)         
#         @users = User.scoped_by_email current_user.email
#         respond_to do |format|
#         format.html
#         format.xml        
#                   end
#         end   
#         
#      
#   def edit
#    @person = Persona.joins(:users).where(:id => current_user.persona.id) 
#    @users= User.find_all_by_email current_user.email
#   end
#    
#       
#   def update
##     @person= Persona.find(params[:id])
#     @users = User.find(params[:id])
#     @users.update_attributes(params[:user])
##     @users.update_attributes(params[:persona])
#     redirect_to matriculasacademicas_menu_principal_alumno_path, :notice => "USUARIO EDITADO CON EXITO"
#   end
end
