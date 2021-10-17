class AddJadwalVoteToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :jadwal_vote, foreign_key: true
  end
end
