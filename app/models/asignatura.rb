class Asignatura < ActiveRecord::Base
  attr_accessible :asig_abreviat, :asig_nombre, :malla
  has_many :distributivos
  has_many :calificaciones
  
 
  has_many :mults, :class_name => 'Mult'
  has_many :mallas, :through => :mults
  has_many :nivels, :through => :mults
  
  
  
   validates :asig_nombre, presence: true
   validates_uniqueness_of :asig_nombre
   validates :asig_abreviat, presence: true
   validates_uniqueness_of :asig_abreviat
  
end
