class CreateSeccions < ActiveRecord::Migration
  #def change
  def self.up
    create_table :seccions do |t|
      t.string :secc_nombre
      t.string :secc_estado

      t.timestamps
    end
  end
end
