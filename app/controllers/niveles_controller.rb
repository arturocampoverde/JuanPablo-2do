class NivelesController < ApplicationController
  
#before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
  before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
  before_filter :authenticated_admin 
  
  def index
    @nivel= Nivel.find(:all)
    @nivele= Nivele.find(:all)
  end
  
  
  def new
    @nivel= Nivel.new
    @nivele = Nivele.find(:all)
   # @nivele= Nivele.new
  end
     
  
  def create
    @nivel = Nivel.new(params[:nivel])
    #@nivele = Nivel.new(params[:nivele])
       if @nivel.save 
       #if @nivel.save and @nivele.save
    redirect_to niveles_menu_principal_admin_path,  :notice => 'CURSO CREADO CON EXITO'
   end
  end
    
   
  
  def show 
    @nivels = Nivel.find(params[:id])
  end

   
   def destroy
    @nivel= Nivel.find(params[:id])
    @nivel.destroy
    redirect_to niveles_menu_principal_admin_path
  end
   
   
   def edit 
   @nivels= Nivel.find(params[:id])
   
    end
    
   
   def update
     @nivel= Nivel.find (params[:id])
     @nivel.update_attributes(params[:nivel])
     redirect_to niveles_menu_principal_admin_path
   end
end
