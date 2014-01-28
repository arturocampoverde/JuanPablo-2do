class Calificacione < ActiveRecord::Base
  belongs_to :asignatura
  belongs_to :matricula
  attr_accessible :calif_tarea, :calif_act_indv, :calif_act_grup, :calif_leccion, :calif_examen, :calif_total, :calif_promedio, :calif_cualit, :calif_conducta, :asignatura_id, :matricula_id, :calif_estado


  
  
validates_presence_of :calif_tarea, presence: true
validates_presence_of :calif_act_indv, presence: true
validates_presence_of :calif_act_grup, presence: true
validates_presence_of :calif_leccion, presence: true
validates_presence_of :calif_promedio, presence: true
validates_presence_of :calif_examen, presence: true
validates_presence_of :calif_conducta, presence: true
validates_presence_of :asignatura_id, presence: true
validates_presence_of :matricula_id, presence: true

#validates_presence_of :pers_apellido, :pers_nombre, :pers_direccion, presence: true

end
