class AddActiveUserToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active_user, :boolean, default: true
  end
end
