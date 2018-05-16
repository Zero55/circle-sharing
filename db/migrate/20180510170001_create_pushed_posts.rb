class CreatePushedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :pushed_posts do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :pushed_num
      t.integer :delete_num

      t.timestamps
    end
  end
end
