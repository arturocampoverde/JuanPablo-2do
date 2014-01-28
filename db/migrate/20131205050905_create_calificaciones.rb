class CreateCalificaciones < ActiveRecord::Migration
  def self.up
    create_table :calificaciones do |t|
      t.decimal :calif_tarea
      t.decimal :calif_act_indv
      t.decimal :calif_act_grup
      t.decimal :calif_leccion
      t.decimal :calif_examen
      t.decimal :calif_total, :precision => 6, :scale => 4, :default => 0
      t.decimal :calif_promedio, :precision => 6, :scale => 4, :default => 0
      t.string :calif_cualit
      t.string :calif_estado
      t.decimal :calif_conducta
      t.timestamps
      t.integer :asignatura_id
      t.integer :matricula_id
      t.references :asignatura, :matricula
      
    end
    add_index(:calificaciones, [:asignatura_id, :matricula_id])
  end
end
