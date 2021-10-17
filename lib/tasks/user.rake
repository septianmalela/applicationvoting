namespace :user do
  namespace :create_user do
    desc "Create User"

    task :create_user do
      (1..10).each do |i|
        user_new = User.new(email: "user_#{i}@gmail.com", password: 'password', password_confirmation: 'password',
                            full_name: "user_#{i}", npm: "#{i}")
        if i <= 3
          user_new.jadwal_vote = JadwalVote.first
        elsif i <= 6
          user_new.jadwal_vote = JadwalVote.second
        else
          user_new.jadwal_vote = JadwalVote.third
        end
        user_new.save
      end
    end
  end
end