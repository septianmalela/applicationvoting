class AddJadwalVoteToListUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :list_users, :jadwal_vote
  end
end
