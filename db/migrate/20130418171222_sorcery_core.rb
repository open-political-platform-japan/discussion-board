class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.string :nickname
      t.string :role
      t.boolean :spam

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :spam
  end

  def self.down
    drop_table :users
  end
end