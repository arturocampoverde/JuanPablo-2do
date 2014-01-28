class Periodo < ActiveRecord::Base
  attr_accessible :period_estad_lect, :period_fech_fin, :period_fech_ini
  has_many :cursos
   
  
   
     validates :period_fech_ini, presence: true
     validates_uniqueness_of :period_fech_ini
     
     validates :period_fech_fin, presence: true
     validates_uniqueness_of :period_fech_fin
     
#     validates_format_of :period_fech_ini, {:with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/, :message => "Formato Incorrecto, Use AÑO/MES/DIA" }
#     validates_format_of :period_fech_fin, {:with=>  /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/, :message => "Formato Incorrecto, Use AÑO/MES/DIA" }
end
