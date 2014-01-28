class PersonasTipo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :persona
  belongs_to :tipo    
  
   
  validates_presence_of :persona_id, :tipo_id
end
 