class CreateLaborals < ActiveRecord::Migration
  #def change
  def self.up
    create_table :laborals do |t|
      t.string :rel_lab_inst_nomb
      t.timestamps
      t.integer :persona_id
      t.references :persona
      
    end
    add_index(:laborals, [ :persona_id])
  end
end

