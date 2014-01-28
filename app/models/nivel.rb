class Nivel < ActiveRecord::Base
 
  set_table_name 'nivels'
   
     
 attr_accessible :nivel_descrip, :nivel_numero, :nivele_id , :asignatura_ids, :malla
  
  
  has_many   :cursos
  belongs_to :nivele
  
  has_many :mults, :class_name => 'Mult'
  has_many :asignaturas, :through => :mults
  has_many :mallas, :through => :mults
  
  
   validates :nivel_numero, presence: true
   validates_uniqueness_of :nivel_numero
   validates :nivel_descrip, presence: true
   validates :nivele_id, presence: true
   
  
   
  
  
end
 