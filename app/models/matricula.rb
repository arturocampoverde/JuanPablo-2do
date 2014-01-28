class Matricula < ActiveRecord::Base
  belongs_to :persona
  belongs_to :curso
  has_many :calificaciones
  attr_accessible :matr_estado, :matr_fech, :matr_folio, :curso_id, :persona_id
end
