# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..300).each do |i|
  user_new = User.new(email: "user#{i}@gmail.com", password: 'password', password_confirmation: 'password',
    full_name: "user_#{i}", npm: "#{i}")
  if i <= 100
    user_new.jadwal_vote = JadwalVote.first
  elsif i <= 200
    user_new.jadwal_vote = JadwalVote.second
  else
    user_new.jadwal_vote = JadwalVote.third
  end
  user_new.save
end