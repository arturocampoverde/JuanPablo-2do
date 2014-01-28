class MatriculasacademicasController < ApplicationController
   
   before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
   before_filter :authenticated_alum

  def menu_principal_alumno
    @periodo_actual = Periodo.last()
    matricula = Matricula.where(:persona_id => current_user.persona_id).last()
    @period_act_matr_alum = matricula.curso.periodo
  end
  
  def new
    @matricula= Matricula.new
    @seccion = Seccion.find(:all)
    @nivel = Nivel.find(:all)
    @periodo = Periodo.find(:last)
    @asignatura = Asignatura.find(:all)
    @persona = Persona.joins(:users).where(:users => {:id => current_user})
    @repre = Persona.joins(:representantes).where(:representantes => {:estudiante_id => current_user.persona.id})
    
    @calif = Calificacione.joins(:matricula).where(:matriculas => {:persona_id => current_user.persona_id})
    @siguiente = "no"
    if @calif.exists?
      @siguiente = "yes"
      @calif.each do |califi|
        if califi.calif_estado.to_s == 'REPROBADO'
            @siguiente = "no"
        end
      end
    end   

    @matr_actual = Matricula.find_by_persona_id(current_user.persona_id)
    if @matr_actual
      @curs_actual = Curso.find(@matr_actual.curso_id)

      if @siguiente == "yes"
        @nive_actual = Nivel.find(:first, :conditions =>["id > ?", @curs_actual.nivel_id] )
      end

      if @siguiente == "no"
        @nive_actual = Nivel.find(@curs_actual.nivel_id)
      end

      @curso = Curso.where(:nivel_id => @nive_actual, :periodo_id => @periodo.id)
    else
      @curso = Curso.where(:periodo_id => @periodo.id)
    end
  end


def imprimir
    @persona = Persona.joins(:users).where(:users => {:id => current_user})
    @repre = Persona.joins(:representantes).where(:representantes => {:estudiante_id => current_user.persona.id})
    #@matr_actual = Matricula.find_by_persona_id(current_user.persona_id)
    @matr_actual = Matricula.where(:persona_id=>current_user.persona_id).last
end

  
  
 def listado
  @matriculas = Matricula.joins(:persona => :users).where(:users => {:persona_id => current_user.persona_id})
 end
  
  
def create
 curso = Curso.find(params[:curso_id])
 @matriculados_en_ese_curso = Matricula.where(:curso_id => curso.id).count()
if @matriculados_en_ese_curso >= curso.cur_capac
  redirect_to matriculasacademicas_new_path, :notice => 'CUPO LLENO'
else
   @matricula = Matricula.new(params[:matricula])
   @matricula.persona_id = current_user.persona.id
   @matricula.curso_id = curso.id
   @matricula.matr_estado = "P"
 if @matricula.save
  redirect_to matriculasacademicas_menu_principal_alumno_path, :notice => 'MATRICULADO'
 end
end
end

 
    def edit 
    @persona= Persona.find(params[:id])
    end
    
    
    
    def update
     @persona= Persona.find (params[:id])
     @persona.update_attributes(params[:persona])
    end
 
 
 
    def index
#       @matriculas = Matricula.all
#       @laboral = Laboral.where(:persona_id => current_user.id)   
        @asignatura = Asignatura.all
#       @asignatura = Asignatura.all
    end      
  
end