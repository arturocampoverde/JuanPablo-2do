class CreateClases < ActiveRecord::Migration
 #def change
  def self.up
    create_table :clases do |t|
      t.string :tip_mall_descrip

      t.timestamps
    end
  end
end
