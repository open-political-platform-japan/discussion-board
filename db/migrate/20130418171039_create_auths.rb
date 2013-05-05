class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.belongs_to :user
      t.string :provider
      t.string :uid
      t.text :omni_hash

      t.timestamps
    end
    add_index :auths, :user_id
  end
end
