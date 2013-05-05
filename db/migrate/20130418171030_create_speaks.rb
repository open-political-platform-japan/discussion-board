class CreateSpeaks < ActiveRecord::Migration
  def change
    create_table :speaks do |t|
      t.belongs_to :user, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :speaks, :user_id
  end
end
