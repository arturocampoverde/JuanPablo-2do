class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username,         :null => false  # if you use another field as a username, for example email, you can safely remove this field.
      t.string :email,            :default => nil # if you use this field as a username, you might want to make it :null => false.
      t.string :usu_estado
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.timestamps
      t.integer :persona_id
      t.references :persona            
    end
    add_index(:users, [ :persona_id])
  end

  def self.down
    drop_table :users
  end
end