class Promocione < ActiveRecord::Base
  attr_accessible :promo_descrip, :promo_descrip_fec_ini, :promo_descrip_fech_fin, :malla_id
  belongs_to :malla  
  has_many :cursos
end
