class AddTotalVoteToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :total_vote, :integer, default: 0
  end
end
