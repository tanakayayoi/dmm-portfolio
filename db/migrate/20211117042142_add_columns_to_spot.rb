class AddColumnsToSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :address, :string
    add_column :spots, :latitude, :float
    add_column :spots, :longitude, :float
    add_column :spots, :post_id, :integer
  end
end
