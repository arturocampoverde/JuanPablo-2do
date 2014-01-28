class CreateAsignaturas < ActiveRecord::Migration
  #def change
  def self.up
    create_table :asignaturas do |t|
      t.string :asig_nombre
      t.string :asig_abreviat

      t.timestamps
    end
  end
  #add_index(:mult, [ :asignatura_id, :malla_id, :nivel_id ])
end
