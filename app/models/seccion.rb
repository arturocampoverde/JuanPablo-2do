class Seccion < ActiveRecord::Base
  attr_accessible :secc_estado, :secc_nombre
  has_many :cursos
  
  
   validates :secc_nombre, presence: true
   validates_uniqueness_of :secc_nombre

  
end
