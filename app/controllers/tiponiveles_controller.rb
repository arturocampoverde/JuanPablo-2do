class TiponivelesController < ApplicationController
  
before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
before_filter :authenticated_admin 
  
  def index
    @nivele= Nivele.find(:all)
  end
  
  
  def new
    @nivele= Nivele.new
  end
     
  
  def create
    @nivele = Nivele.new(params[:nivele])
       if @nivele.save
    redirect_to tiponiveles_menu_principal_admin_path,  :notice => 'TIPO DE NIVEL CREADO CON EXITO'
   end
  end
    
   
  
  def show 
    @niveles = Nivele.find(params[:id])
  end

   
   def destroy
    @nivele= Nivele.find(params[:id])
    @nivele.destroy
    redirect_to tiponiveles_menu_principal_admin_path
  end
   
   
   def edit 
   @niveles= Nivele.find(params[:id])
   
    end
    
   
   def update
     @nivele= Nivele.find (params[:id])
     @nivele.update_attributes(params[:nivele])
     redirect_to tiponiveles_menu_principal_admin_path
   end
  
  
  
end
