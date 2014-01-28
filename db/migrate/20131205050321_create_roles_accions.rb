class CreateRolesAccions < ActiveRecord::Migration
  #def change
  def self.up
    create_table :roles_accions do |t|
      t.integer :role_id
      t.integer :accion_id
      t.timestamps
      t.references :role, :accion
      
    end
    add_index(:roles_accions, [:role_id, :accion_id], :unique=>true)
  end
end
