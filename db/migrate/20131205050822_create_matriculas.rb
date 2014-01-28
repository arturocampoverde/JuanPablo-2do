class CreateMatriculas < ActiveRecord::Migration
  #def change
  def self.up
    create_table :matriculas do |t|
      t.date :matr_fech
      t.integer :matr_folio
      t.string :matr_estado
      t.timestamps
      t.integer :curso_id
      t.integer :persona_id
      t.references :curso
      t.references :persona
      
    end
    add_index(:matriculas, [:curso_id, :persona_id])
  end
end
