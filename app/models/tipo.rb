class Tipo < ActiveRecord::Base
   
   attr_accessible :tip_descrip, :tip_estado
   
   
  has_many :personas_tipos
  has_many :personas, :through => :personas_tipos
  
   #has_many :personas
   #has_and_belongs_to_many :personas_tipos
   
  
  
  
  #belongs_to :resource, :polymorphic => true 
end
  