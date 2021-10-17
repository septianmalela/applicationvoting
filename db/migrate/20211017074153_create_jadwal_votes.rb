class CreateJadwalVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :jadwal_votes do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
