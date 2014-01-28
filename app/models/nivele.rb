class Nivele < ActiveRecord::Base
  
  
  has_many :nivels
  attr_accessible :tip_niv_nombre
  
  
   validates :tip_niv_nombre, presence: true
   validates_uniqueness_of :tip_niv_nombre
  
end
