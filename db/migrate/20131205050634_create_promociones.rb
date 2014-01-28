class CreatePromociones < ActiveRecord::Migration
   #def change
  def self.up
    create_table :promociones do |t|
      t.string :promo_descrip
      t.date   :promo_descrip_fec_ini
      t.date   :promo_descrip_fech_fin
      
      t.timestamps
      t.integer :malla_id
      t.references :malla
      
    end
    add_index(:promociones, [:malla_id ])
  end
end
 