class CursosrealizadosController < ApplicationController
#   before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
#   load_and_authorize_resource :only => [:new, :edit, :destroy] CON ESTO DIGO QUE "NO PUEDE VER EL CONTENIDO"
   before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
#   before_filter :authenticated_prof
   #skip_
  
  def index 
    @estudio = Estudio.where(:persona_id => current_user.persona.id)
    @laboral = Laboral.where(:persona_id => current_user.persona.id)    
  end
    
  
  def error
    
  end
  
   
  def new
    @estudio= Estudio.new
    @laboral= Laboral.new
  end
  
  

  
  def horario
  @periodo_actual = Periodo.last()
# @niveles = Nivel.joins(:cursos => :distributivos).where(:distributivos => {:persona_id => current_user.persona.id, :periodos => {:id => @periodo_actual.id}}).select("DISTINCT(nivel_numero)")   
      
    
# @niveles = Nivel.joins(:asignaturas => {:distributivos => { :curso => :periodo}}).where(:periodos => {:id => @periodo_actual.id}).select("DISTINCT(nivel_numero)")
    

#      @asignaturas = Distributivo.where(:persona_id => current_user.persona.id).select("DISTINCT(distr_horarioa),(asig_nombre)")
#      @asignaturas = Asignatura.joins(:distributivos).where(:distributivos => {:persona_id => current_user.persona.id}).uniq     
  #@niveles = Nivel.joins(:cursos => :distributivos).where(:distributivos => {:persona_id => current_user.persona.id}).select("DISTINCT(nivel_numero)")
    
    
  #@asignaturas = Asignatura.joins(:distributivos =>{:curso => :periodo}).where(:periodos => {:id => @periodo_actual.id}).select("DISTINCT(asig_nombre)")
  @distributivo = Distributivo.joins(:curso => :periodo).where(:persona_id => current_user.persona.id, :periodos => {:id => @periodo_actual.id})#.select("DISTINCT(distr_horarioa),(distr_horariob)")
  end
  
  

      
  
  def create                                
    @estudio = Estudio.new(params[:estudio])
    @laboral = Laboral.new(params[:laboral])              
     
    @laboral.persona_id = current_user.persona.id
    @estudio.persona_id = current_user.persona.id
            
    if @estudio.save and @laboral.save
    redirect_to cursosrealizados_menu_principal_profesor_path,  :notice => 'CURRICULUM CREADO'   
    else
    render :new
    end
  end
  
    def lista
     @distributivo = Distributivo.where(:persona_id => current_user.persona.id)
    end
    
    
    
      def imprimir_lista
        @distributivo = Distributivo.find(params[:distr_id])
        @alumnos = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id})
     
        @alumnos_count = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id}).count()
        @matricula = Matricula.where(:persona_id => @alumnos)
      end
  
      
   
  
    def show 
    @estudios = Estudio.find(params[:id])
    @laborals = Laboral.find(params[:id])
    end
   
   
       
   def edit 
     @estudios = Estudio.find(params[:id])
     @laborals = Laboral.find(params[:id])     
     if @estudios.persona.id and @laborals.persona.id == current_user.persona_id
     
     else
     
      :render_404  
     
       
       if @estudios.id.present? and @laborals.id.present?
       
       flash[:error] = ""
       redirect_to cursosrealizados_menu_principal_profesor_path
     end         
   end
   end
   
#render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false MUESTRA MENSAJE DE ERROR DE URL INCORRECTA      
#    modelo = Modelo.find(params[:id]) rescue nil
#    redirect_to root_path if modelo.nil?
   
    
   
   
  def update
     if current_user.has_role? :profesor
     @estudio= Estudio.find (params[:id])
     @estudio.update_attributes(params[:estudio])
     @laboral= Laboral.find (params[:id])
     @laboral.update_attributes(params[:laboral])
     redirect_to cursosrealizados_menu_principal_profesor_path,  :notice => 'CURRICULUM ACTUALIZADO'  
     
     else
     @estudio= Estudio.find (params[:id])
     @estudio.update_attributes(params[:estudio])
     @laboral= Laboral.find (params[:id])
     @laboral.update_attributes(params[:laboral])
     redirect_to secretarias_menu_principal_secretaria_path,  :notice => 'CURRICULUM ACTUALIZADO'
   end
  end
   
   
end
