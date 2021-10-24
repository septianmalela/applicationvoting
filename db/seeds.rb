# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
JadwalVote.destroy_all
Post.destroy_all

start_time_1 = '2021-10-18 09:00'.to_time
end_time_1 = '2021-10-18 12:00'.to_time

start_time_2 = '2021-10-19 09:00'.to_time
end_time_2 = '2021-10-19 12:00'.to_time

start_time_3 = '2021-10-20 09:00'.to_time
end_time_3 = '2021-10-20 12:00'.to_time

start_time_4 = '2021-10-21 09:00'.to_time
end_time_4 = '2021-10-21 12:00'.to_time

jadwal_votes = [
  {
    start_time: start_time_1,
    end_time: end_time_1
  },
  {
    start_time: start_time_2,
    end_time: end_time_2
  },
  {
    start_time: start_time_3,
    end_time: end_time_3
  },
  {
    start_time: start_time_4,
    end_time: end_time_4
  }
]

JadwalVote.create(jadwal_votes)

(1..300).each do |i|
  user_new = User.new(email: "user#{i}@gmail.com", password: 'password', password_confirmation: 'password',
    full_name: "user_#{i}", npm: "#{i}")
  user_new.email_for_test = true
  user_new

  if i <= 100
    user_new.jadwal_vote = JadwalVote.first
  elsif i <= 200
    user_new.jadwal_vote = JadwalVote.second
  else
    user_new.jadwal_vote = JadwalVote.third
  end
  user_new.save
  user_new.confirm
end
