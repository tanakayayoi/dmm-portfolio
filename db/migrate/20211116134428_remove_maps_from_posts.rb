class RemoveMapsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :address, :text
    remove_column :posts, :latitude, :float
    remove_column :posts, :longitude, :float
  end
end
