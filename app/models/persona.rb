class Persona < ActiveRecord::Base   
  
  
  attr_accessible :pers_apellido, :pers_cedula, :pers_direccion, :pers_nombre, :pers_telefono2, :pers_telefono1, :pers_email
  
  has_many :personas_tipos
  has_many :tipos, :through => :personas_tipos
   
   
  has_many :distributivos
  has_many :estudios
  has_many :users
  has_many :matriculas
  has_many :laborals
  has_many :representantes
   
  
  
  
  
  validates :pers_email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } 
  
  
  
  validates_presence_of :pers_apellido, :pers_nombre, :pers_direccion, presence: true
#  validates_uniqueness_of :pers_cedula
  
  
  
  
  
  
    def self.search(search)
    if search
      where('pers_nombre LIKE (?) or pers_apellido LIKE (?) or pers_cedula LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  
end
 
  