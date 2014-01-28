class CreateCursos < ActiveRecord::Migration
  #def change
  def self.up
    create_table :cursos do |t|
      t.string :cur_nombre
      t.string :cur_paralelo
      t.integer :cur_capac
      t.timestamps
      t.integer :promocione_id
      t.integer :periodo_id
      t.integer :seccion_id
      t.integer :nivel_id
      t.references :promocione
      t.references :periodo
      t.references :seccion
      t.references :nivel
      
    end
    add_index(:cursos, [:promocione_id, :periodo_id, :seccion_id, :nivel_id], :name=>"propeseni")
  end
  
  def self.down
    drop_table :cursos
  end
  
end
