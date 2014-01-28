class LectivosController < ApplicationController
  
#before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
 before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
 before_filter :authenticated_admin 
  
   def index
    @periodo= Periodo.find(:all)
   end
  
  
  def new
    @periodo= Periodo.new
  end
      
  
  def create
    @periodo = Periodo.new(params[:periodo])
       if @periodo.save
    redirect_to lectivos_menu_principal_admin_path,  :notice => 'PERIODO LECTIVO CREADO CON EXITO'
   end
  end
    
   
  
  def show 
    @periodos = Periodo.find(params[:id])
  end

   
   def destroy
    @periodo= Periodo.find(params[:id])
    @periodo.destroy
    redirect_to lectivos_menu_principal_admin_path
  end
   
   
   def edit 
   @periodos= Periodo.find(params[:id])
   
    end
    
   
   def update
     @periodo= Periodo.find (params[:id])
     @periodo.update_attributes(params[:periodo])
     redirect_to lectivos_menu_principal_admin_path
   end
  
end
