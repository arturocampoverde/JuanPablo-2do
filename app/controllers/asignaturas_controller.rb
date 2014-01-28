class AsignaturasController < ApplicationController      

#before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
# before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
# before_filter :authenticated_admin
    
  
  def index
    @asignatura= Asignatura.find(:all)
  end
  
  
  def new
    @asignatura= Asignatura.new
  end
    
  
  def create
    @asignatura = Asignatura.new(params[:asignatura])
       if @asignatura.save
    redirect_to asignaturas_menu_principal_admin_path,  :notice => 'ASIGNATURA CREADA CON EXITO'
   end
  end
    
   
  
  def show 
    @asignaturas = Asignatura.find(params[:id])
  end

  
   def destroy
    @asignatura= Asignatura.find(params[:id])
    @asignatura.destroy
    redirect_to asignaturas_menu_principal_admin_path
  end
   
    
   def edit 
   @asignaturas= Asignatura.find(params[:id])
   
    end
    
   
   def update
     @asignatura= Asignatura.find (params[:id])
     @asignatura.update_attributes(params[:asignatura])
     redirect_to asignaturas_menu_principal_admin_path
   end
   
   
   
  
  
end