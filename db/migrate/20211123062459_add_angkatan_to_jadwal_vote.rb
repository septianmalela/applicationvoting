class AddAngkatanToJadwalVote < ActiveRecord::Migration[6.1]
  def change
    add_column :jadwal_votes, :angkatan, :integer, default: 0
  end
end
