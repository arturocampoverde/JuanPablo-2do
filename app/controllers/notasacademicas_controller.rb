class NotasacademicasController < ApplicationController
   before_filter :require_login, :only => [:new, :edit, :destroy, :show, :index]
   before_filter :authenticated_alum
  
  def index
    @asignaturas = Asignatura.joins(:distributivos => [:curso => :matriculas]).where(:matriculas => {:persona_id => current_user.persona.id})
    @cursos = Curso.joins(:matriculas).where(:matriculas => {:persona_id => current_user.persona.id})
    #@notas = Calificacione.joins(:matricula).where(:matriculas => {:persona_id => current_user.persona.id})
    @matriculas = Matricula.where(:persona_id => current_user.persona.id, :matr_estado=>"V")
  end
end