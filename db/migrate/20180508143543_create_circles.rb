class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :circles, :follower_id
    add_index :circles, :followed_id
    add_index :circles, [:follower_id, :followed_id], unique: true
  end
end
