class CreateTipos < ActiveRecord::Migration
   #def change
  def self.up
    create_table (:tipos) do |t|
      t.string :tip_descrip
      t.string :tip_estado
      t.timestamps
    end
  end
end 