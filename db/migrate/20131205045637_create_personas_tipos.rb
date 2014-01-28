class CreatePersonasTipos < ActiveRecord::Migration
  def up
    create_table :personas_tipos, :id => false do |t|
      t.integer :persona_id
      t.integer :tipo_id
      t.references :persona, :tipo
      t.timestamps
    end
    add_index(:personas_tipos,[:persona_id, :tipo_id], :unique=>true)
  end

  def down
  end
end




