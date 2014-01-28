class SeccionesController < ApplicationController
  
before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
before_filter :authenticated_admin
  
  
  def index
    @seccion= Seccion.find(:all)
  end
  
  
  def new
    @seccion= Seccion.new
  end
     
  
  def create
    @seccion = Seccion.new(params[:seccion])
       if @seccion.save
    redirect_to secciones_menu_principal_admin_path,  :notice => 'SECCIÓN CREADA CON EXITO'
   end
  end
    
   
  
  def show 
    @seccions = Seccion.find(params[:id])
  end

   
   def destroy
    @seccion= Seccion.find(params[:id])
    @seccion.destroy
    redirect_to secciones_menu_principal_admin_path
  end
   
   
   def edit 
   @seccions= Seccion.find(params[:id])
   
    end
    
   
   def update
     @seccion= Seccion.find (params[:id])
     @seccion.update_attributes(params[:seccion])
     redirect_to secciones_menu_principal_admin_path
   end
      
end
