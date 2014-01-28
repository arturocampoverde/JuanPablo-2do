class ParalelosController < ApplicationController
  
#before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index] # => CONTROLO QUE EL USUARO NO PUEDA VER NADA DE ESTO
#load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
  before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
  before_filter :authenticated_admin 
  
  
  def new
    @curso = Curso.new
    @seccion = Seccion.find(:all)
    @nivel = Nivel.find(:all)
    @periodo = Periodo.find(:last)
  end
      
  
  def create               
       @curso = Curso.new(params[:curso])                 
       if @curso.save 
       redirect_to paralelos_menu_principal_admin_path,  :notice => 'PARALELO CREADO CON EXITO'
       end
  end
  
  
   def edit 
    @cursos= Curso.find(params[:id])
    @seccion = Seccion.find(:all)
    @nivel = Nivel.find(:all)
    @periodo = Periodo.find(:all)
   end  
  
   
   def update
    @cursos= Curso.find (params[:id])
    @cursos.update_attributes(params[:curso])
    redirect_to paralelos_menu_principal_admin_path,  :notice => 'PARALELO EDITADO CON EXITO'
   end
   
   
  def index
   @cursos = Curso.all          
  end
   
   
   
    
end