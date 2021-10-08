class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name_1
      t.string :name_2
      t.string :visi
      t.text :misi

      t.timestamps
    end
  end
end
