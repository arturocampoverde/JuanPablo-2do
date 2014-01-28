class CreateRepresentantes < ActiveRecord::Migration
  #def change
  def self.up
    create_table :representantes do |t|
      t.string :repre_parentesco
      t.string :repre_estado
      t.timestamps
      t.integer :estudiante_id
      t.integer :persona_id
      t.references :estudiante, :persona
      
    end
    add_index(:representantes, [:estudiante_id, :persona_id])
  end
end
