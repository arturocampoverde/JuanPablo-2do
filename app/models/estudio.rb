class Estudio < ActiveRecord::Base
  belongs_to :persona
  attr_accessible :est_instituto, :est_nivel, :est_titulos
end
