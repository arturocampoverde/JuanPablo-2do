class CreatePeriodos < ActiveRecord::Migration
  #def change
  def self.up
    create_table :periodos do |t|
      t.text :period_fech_ini
      t.text :period_fech_fin
      t.string :period_estad_lect
      t.timestamps
    end
  end
end
