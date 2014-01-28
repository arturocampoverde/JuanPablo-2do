class CursosprofesoresController < ApplicationController    
  
 before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
 before_filter :authenticated_prof
  
  def index
    #@cursos = Curso.joins(:distributivos).where(:distributivos => {:persona_id => current_user.persona.id})
    @periodo_actual = Periodo.last()
    @distributivo = Distributivo.joins(:curso => :periodo).where(:persona_id => current_user.persona.id, :periodos => {:id => @periodo_actual.id})
    #@distributivo = Distributivo.where(:persona_id => current_user.persona.id)
    #@asig = Asignatura.joins(:distributivos).where(:distributivos => {:persona_id => current_user.persona.id}).uniq
  end
  
  
  def lista
    @periodo_actual = Periodo.last()
    @distributivo = Distributivo.joins(:curso => :periodo).where(:persona_id => current_user.persona.id, :periodos => {:id => @periodo_actual.id})
  end
  
  
  def imprimir_lista
    @distributivo = Distributivo.find(params[:distr_id])
    @alumnos = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id})
    
    @alumnos_count = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id}).count()
    @matricula = Matricula.where(:persona_id => @alumnos)
  end
  
  
  
  def new
    @distributivo = Distributivo.find(params[:distr_id])
    @alumnos = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id})
    @calificaciones = @alumnos.joins(:matriculas => :calificaciones).where(:calificaciones => {:asignatura_id => @distributivo.asignatura_id})
        
    @alumnos_count = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id}).count()
    #@matricula = Matricula.joins(:curso).where(:persona_id => @alumnos, :cursos => {:curso_id => @distributivo.curso_id})
  end
  
  
  
  def create
    #Calificacione.create(calif_deber: params[:deberes].at(0), calif_leccion: params[:actuacion].at(0), calif_trabajo: params[:leccion].at(0), calif_aporte: params[:examen].at(0), calif_examen: params[:total].at(0), calif_conducta: params[:promedio].at(0), id_asignatura: params[:asignatura_id], id_matricula: params[:matricula_ids].at(0))
#    @nota = Calificacione.new
#
#      @nota.calif_deber = params[:deberes].at(0)
#      @nota.calif_leccion = params[:actuacion].at(0)
#      @nota.calif_trabajo = params[:leccion].at(0)
#      @nota.calif_aporte = params[:examen].at(0)
#      @nota.calif_examen = params[:total].at(0)
#      @nota.calif_conducta = params[:promedio].at(0)
#      @nota.id_asignatura = params[:asignatura_id]
#      @nota.id_matricula = params[:matricula_ids].at(0)
#      @nota.save
    alumnos_count = params[:contador_alumnos]
    alumnos_count = alumnos_count.to_i
    for i in 0..(alumnos_count-1)
      estado = ""
      if params[:promedio].at(i)  >= "6.5"
        estado = "APROBADO" 
      else
        estado = "REPROBADO"
      end

      Calificacione.create(calif_tarea: params[:tarea].at(i), calif_act_indv: params[:act_indiv].at(i), calif_act_grup: params[:act_grup].at(i), calif_leccion: params[:leccion].at(i), calif_examen: params[:examen].at(i), calif_total: params[:total].at(i), calif_promedio: params[:promedio].at(i), calif_cualit: params[:cualitativo].at(i), calif_conducta: params[:conducta].at(i), calif_estado: estado, asignatura_id: params[:asignatura_id], matricula_id: params[:matricula_ids].at(i))
    end
   redirect_to alumnos_matriculados_path(:distr_id =>params[:distributivo_id]), :notice => "Guardado con exito"
  end

  
  
  def edit
    @distributivo = Distributivo.find(params[:distr_id])
    @alumnos = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id})
    @calificaciones = Calificacione.joins({:matricula => :persona}, :asignatura).where(:matriculas => {:curso_id => @distributivo.curso_id}, :asignaturas => {:id => @distributivo.asignatura_id})
    #@asignatura = Asignatura.joins(:distributivos).where(:distributivos =>{:curso_id => params[:curso_id], :persona_id => current_user.persona.id})
    #@persona = Persona.joins(:distributivos).where(:distributivos =>{:curso_id => params[:curso_id], :persona_id => current_user.persona.id})
    #@curso = Curso.joins(:distributivos).where(:distributivos =>{:curso_id => params[:curso_id], :persona_id => current_user.persona.id})
    @alumnos_count = Persona.joins(:matriculas => :curso).where(:matriculas => {:curso_id => @distributivo.curso_id}).count()
    @matricula = Matricula.where(:persona_id => @alumnos)
  end


  

  def update
    i = 0
    params[:calificaciones_ids].each do |ci|
      estado = ""
      if params[:promedio].at(i)  >= "6.5"
        estado = "APROBADO"
      else
        estado = "REPROBADO"
      end
      @calif = Calificacione.find(ci)
      @calif.update_attributes(calif_tarea: params[:tarea].at(i), calif_act_indv: params[:act_indiv].at(i), calif_act_grup: params[:act_grup].at(i), calif_leccion: params[:leccion].at(i), calif_examen: params[:examen].at(i), calif_total: params[:total].at(i), calif_promedio: params[:promedio].at(i), calif_conducta: params[:conducta].at(i), calif_estado: estado)
      i+=1
    end
    redirect_to cursosrealizados_menu_principal_profesor_path,  :notice => 'Calificación Actualizada'
  end
  
end