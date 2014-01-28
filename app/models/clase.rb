class Clase < ActiveRecord::Base

  attr_accessible :tip_mall_descrip 
  has_many :mallas, :dependent => :destroy
  
  
   validates :tip_mall_descrip, presence: true
   validates_uniqueness_of :tip_mall_descrip
  
end
