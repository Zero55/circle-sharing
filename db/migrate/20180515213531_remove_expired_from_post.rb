class RemoveExpiredFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :expire
  end
end
