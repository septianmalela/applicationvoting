class AddImageWakilDataToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :wakil_data, :text
  end
end
