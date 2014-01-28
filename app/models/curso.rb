class Curso < ActiveRecord::Base
  belongs_to :seccion
  belongs_to :periodo
  belongs_to :nivel
  belongs_to :promocione
  has_many :matriculas
  has_many :distributivos
  attr_accessible :cur_nombre, :cur_paralelo,  :cur_capac, :nivel_id, :seccion_id, :periodo_id
  
  
     validates :cur_paralelo, presence: true
     validates :nivel_id, presence: true
     validates :seccion_id, presence: true
     validates :periodo_id, presence: true

end

