class Distributivo < ActiveRecord::Base
   attr_accessible :distr_fecha, :distr_estado, :distr_horarioa,  :persona_id, :asignatura_id, :curso_id 
   belongs_to :asignatura
   belongs_to :persona
   belongs_to :curso
   
   validates :persona_id, presence: true
   validates :asignatura_id, presence: true
   validates :curso_id, presence: true
   validates :distr_fecha, presence: true
  
end 
