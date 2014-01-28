class CreateDistributivos < ActiveRecord::Migration
  #def change
  def self.up
    create_table :distributivos do |t|
      t.date :distr_fecha
      t.string :distr_horarioa
      t.string :distr_estado
      t.timestamps
      t.integer :persona_id
      t.integer :asignatura_id
      t.integer :curso_id
      t.references :persona, :asignatura, :curso
      
    end
    add_index(:distributivos, [:persona_id, :asignatura_id, :curso_id], :name=>"peracur")
  end
end 
