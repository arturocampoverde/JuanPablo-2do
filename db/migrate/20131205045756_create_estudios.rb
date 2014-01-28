class CreateEstudios < ActiveRecord::Migration
 #def change
  def self.up
    create_table :estudios do |t|
      t.string :est_nivel
      t.string :est_instituto
      t.string :est_titulos
      t.timestamps
      t.integer :persona_id
      t.references :persona
      
    end
    add_index(:estudios, [ :persona_id])
  end
end
