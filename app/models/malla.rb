class Malla < ActiveRecord::Base
  attr_accessible :mall_estado , :clase_id, :mall_fech_inic, :mall_fech_fin 
  
  
  
  belongs_to :clase
  
  has_many :promociones
  has_many :mults, :class_name => 'Mult'
  has_many :asignaturas, :through => :mults
  has_many :nivels, :through => :mults
  
  validates :clase_id, presence: true
  
   
end
   