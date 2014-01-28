class CreateMallas < ActiveRecord::Migration
 def self.up
    create_table :mallas do |t|
      t.string :mall_estado
      t.text :mall_fech_inic
      t.text :mall_fech_fin
      t.timestamps
      t.integer :clase_id
      t.references :clase

    end
    add_index(:mallas, [:clase_id ])
  end

  def down
  end
end