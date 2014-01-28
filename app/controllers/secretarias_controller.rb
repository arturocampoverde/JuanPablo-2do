class SecretariasController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
 before_filter :authenticated_secreta
# 
  
 
  
#   helper_method :sort_column, :sort_direction
 
   def curriculsecretari 
    @estudio = Estudio.where(:persona_id => current_user.persona.id)
    @laboral = Laboral.where(:persona_id => current_user.persona.id)    
   end
   
  def new
    @estudio= Estudio.new
    @laboral= Laboral.new
  end

  
  
  
  
  
  
  
  
# BUSCAR DISTRIBUTIVO POR PERIODO LECTIVO  
  def ind_distr
    @periodos = Periodo.find(:all)
  end

  def result_busqueda
    @periodos = Periodo.where('period_fech_ini LIKE ?', params[:fecha_inicio]) unless params[:fecha_inicio].blank?
    @periodos = @periodos.where('period_fech_fin LIKE ?', params[:fecha_fin]) unless params[:fecha_fin].blank?
  end
  
  
  
  
  
# BUSCAR MALLAS CURRICULARES POR PERIODO LECTIVO
  def ind_mall
  @periodos_count = Periodo.count()
   if @periodos_count > 1
     @ultimo_periodo = Periodo.find(:last)
   else
     @ultimo_periodo = Periodo.find(:first)
   end
   
   @mallas = Malla.where(:mall_fech_fin => @ultimo_periodo.period_fech_fin)
  end
  
  def result_busquedamalla  
    @mallas = Malla.where('mall_fech_inic LIKE ?', params[:fecha_inicio]) unless params[:fecha_inicio].blank?
    @mallas = @mallas.where('mall_fech_fin LIKE ?', params[:fecha_fin]) unless params[:fecha_fin].blank?   
  end
  
  

  
  
#BUSCAR ALUMNO POR MEDIO DE LA CEDULA Y VER SUS NOTAS 
#FALTAAAAAAAAAAAAAAAAA
#  def result_busquedapers
#    @personas = Persona.where('pers_cedula LIKE ?', params[:persona_cedula]) unless params[:persona_cedula].blank?
#    @mallas = @mallas.where('mall_fech_fin LIKE ?', params[:fecha_fin]) unless params[:fecha_fin].blank?
#  end
#  
#  def ind_perso
#    @personas = Persona.find(:all)
#  end

  
  
  
  
  
  

#BUSCAR LISTA DE ALUMNOS EN TODOS LOS CURSOS POR MEDIO DEL PERIODO LECTIVO
  def ind_estud
    #@periodos = Periodo.find(:all)
  end

  def result_estud
    @periodos = Periodo.where('period_fech_ini LIKE ?', params[:fecha_inicio]) unless params[:fecha_inicio].blank?
    @periodos = @periodos.where('period_fech_fin LIKE ?', params[:fecha_fin]) unless params[:fecha_fin].blank?
  end

  
  
  
  def estudiantes_curso
    curso_id = params[:curso_id]
    @estudiantes = Persona.joins(:matriculas).where(:matriculas => {:curso_id => curso_id})
  end
  
  
  
  
  
  def ind_estud_estado
    #@periodos = Periodo.find(:all)
  end


  def result_estud_estado
    @periodos = Periodo.where('period_fech_ini LIKE ?', params[:fecha_inicio]) unless params[:fecha_inicio].blank?
    @periodos = @periodos.where('period_fech_fin LIKE ?', params[:fecha_fin]) unless params[:fecha_fin].blank?
  end

  def estudiantes_estado
    curso_id = params[:curso_id]
    #@estudiantes = Persona.joins(:matriculas).where(:matriculas => {:curso_id => curso_id})
    @matriculas = Matricula.where(:curso_id => curso_id)
    
    
  end
  
  
  
  def create
    @estudio = Estudio.new(params[:estudio])
    @laboral = Laboral.new(params[:laboral])              
     
    @laboral.persona_id = current_user.persona.id
    @estudio.persona_id = current_user.persona.id
            
    if @estudio.save and @laboral.save
      redirect_to secretarias_menu_principal_secretaria_path,  :notice => 'CURRICULUM CREADO'
    else
    render :new
    end
  end
  
     
            
   def edit 
     @estudios = Estudio.find(params[:id])
     @laborals = Laboral.find(params[:id])     
     if @estudios.persona.id and @laborals.persona.id == current_user.persona_id
     
     else
     
      :render_404  
     
       
       if @estudios.id.present? and @laborals.id.present?
       
       flash[:error] = ""
       redirect_to secretarias_menu_principal_secretaria_path
     end         
   end
   end
   
#render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false MUESTRA MENSAJE DE ERROR DE URL INCORRECTA      
#    modelo = Modelo.find(params[:id]) rescue nil
#    redirect_to root_path if modelo.nil?
   
    
   
   
   def update
     @estudio= Estudio.find (params[:id])
     @estudio.update_attributes(params[:estudio])
     @laboral= Laboral.find (params[:id])
     @laboral.update_attributes(params[:laboral])
     redirect_to secretarias_menu_principal_secretaria_path ,  :notice => 'CURRICULUM ACTUALIZADO'   
   end
   
   
#     private
#  def sort_column
#    @periodos = Periodo.where('period_fech_ini LIKE ?', params[:fecha_inicio]) unless params[:fecha_inicio].blank?
#    @periodos = @periodos.where('period_fech_fin LIKE ?', params[:fecha_fin]) unless params[:fecha_fin].blank?
#    @periodos = Nivel.joins(:cursos => :periodo).where(:periodos => {:id => @periodos})
#    Nivel.column_names.include?(params[:sort]) ? params[:sort] : "nivel_numero"
#  end
#
#  def sort_direction
#    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
#  end
  
end
