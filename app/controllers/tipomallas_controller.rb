class TipomallasController < ApplicationController  
  
before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
before_filter :authenticated_admin  
  
  def index
    @clase= Clase.find(:all)
  end
  
  
  def new
    @clase= Clase.new
  end
    
  
  def create
    @clase = Clase.new(params[:clase])
       if @clase.save
    redirect_to tipomallas_menu_principal_admin_path,  :notice => 'TIPO DE MALLA CREADA CON EXITO'
   end
  end
    
   
  
  def show 
    @clases = Clase.find(params[:id])
  end

  
   def destroy
    @clase= Clase.find(params[:id])
    @clase.destroy
    redirect_to tipomallas_menu_principal_admin_path
  end
   
   
   def edit 
   @clases= Clase.find(params[:id])
   
    end
    
   
   def update
     @clase= Clase.find (params[:id])
     @clase.update_attributes(params[:clase])
     redirect_to tipomallas_menu_principal_admin_path
   end    
end
