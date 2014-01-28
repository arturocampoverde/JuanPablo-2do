class CreateMults < ActiveRecord::Migration
 #def change
  def self.up
    create_table :mults, :id => true do |t|
    t.integer :asignatura_id
    t.integer :malla_id
    t.integer :nivel_id
    t.references :asignatura
    t.references :malla
    t.references :nivel
    t.timestamps
    end
  end
end 