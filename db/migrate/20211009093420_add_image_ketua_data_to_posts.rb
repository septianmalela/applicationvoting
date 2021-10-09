class AddImageKetuaDataToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :ketua_data, :text
  end
end
