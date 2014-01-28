class Mult < ActiveRecord::Base
 
  self.primary_key = "id"
  
  set_table_name 'mults'
  
  attr_accessible :asignatura_id, :malla_id, :nivel_id

  belongs_to :asignatura    
  belongs_to :malla
  belongs_to :nivel  
  
  
  
  
#  validates :nivel_id, presence: true

  
  
end
 