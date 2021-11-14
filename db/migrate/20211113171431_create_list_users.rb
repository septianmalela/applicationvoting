class CreateListUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :list_users do |t|
      t.string  :email
      t.string  :name
      t.integer :angkatan, default: 0
      t.string  :code

      t.timestamps
    end
  end
end
