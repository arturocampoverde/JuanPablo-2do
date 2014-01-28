class CreateNiveles < ActiveRecord::Migration
 #def change
  def self.up
    create_table :niveles do |t|
    t.string :tip_niv_nombre                    
    t.timestamps
    end
  end
end
