class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.integer :user_id
      t.integer :share_id

      t.timestamps
    end
    add_index :peeps, :user_id
    add_index :peeps, :share_id
  end
end
