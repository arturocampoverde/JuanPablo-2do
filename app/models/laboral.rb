class Laboral < ActiveRecord::Base
  belongs_to :persona
  attr_accessible :rel_lab_inst_nomb
end
