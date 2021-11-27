# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Post.destroy_all
JadwalVote.destroy_all

start_time_1 = Date.today
end_time_1 = Date.today + 1.days

start_time_2 = Date.today + 1.days
end_time_2 = Date.today + 2.days

start_time_3 = Date.today + 2.days
end_time_3 = Date.today + 3.days

start_time_4 = Date.today + 3.days
end_time_4 = Date.today + 4.days

jadwal_votes = [
  {
    start_time: start_time_1.to_time,
    end_time: end_time_1.to_time
  },
  {
    start_time: start_time_2.to_time,
    end_time: end_time_2.to_time
  },
  {
    start_time: start_time_3.to_time,
    end_time: end_time_3.to_time
  },
  {
    start_time: start_time_4.to_time,
    end_time: end_time_4.to_time
  }
]

JadwalVote.create(jadwal_votes)

(1..500).each do |i|
  user_new = User.new(email: "user#{i}@gmail.com", password: 'password', password_confirmation: 'password',
    full_name: "user_#{i}", npm: "#{i}")
  user_new.email_for_test = true
  user_new

  if i <= 200
    user_new.jadwal_vote = JadwalVote.first
  elsif i <= 400
    user_new.jadwal_vote = JadwalVote.second
  else
    user_new.jadwal_vote = JadwalVote.third
  end
  user_new.skip_confirmation!
  user_new.save(validate: false)
end
