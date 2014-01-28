class Representante < ActiveRecord::Base
#  attr_accessible :repre_parentesco, :repre_estado, :estudiante_id
  
  attr_accessible :repre_parentesco, :repre_estado,  :estudiante_id, :representante_id
  
    belongs_to :persona

end
