class AddIndexToMults < ActiveRecord::Migration
   #def change
  def self.up
    add_index(:mults, [ :asignatura_id, :malla_id, :nivel_id ], :unique=>true)
  end
end