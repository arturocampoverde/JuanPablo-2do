class RolifyCreateRoles < ActiveRecord::Migration
   #def change
  def self.up
    create_table(:roles) do |t|
      t.string :name
      t.string :rol_observ
      t.references :resource, :polymorphic => true
      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ], :unique=>true)
  end
end

