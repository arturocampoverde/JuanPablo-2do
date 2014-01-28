class CreateAccions < ActiveRecord::Migration
  #def change
  def self.up
    create_table :accions do |t|
      t.string :acc_nombre
      t.timestamps
    end
  end
end
