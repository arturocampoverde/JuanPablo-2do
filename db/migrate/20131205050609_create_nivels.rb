class CreateNivels < ActiveRecord::Migration
 #def change
  def self.up
    create_table :nivels do |t|
      t.integer :nivel_numero
      t.string :nivel_descrip
      t.timestamps
      t.integer :nivele_id
      t.references :nivele
      
    end
    add_index(:nivels, [:nivele_id ])
  end
end
