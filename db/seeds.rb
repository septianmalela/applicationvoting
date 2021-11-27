require 'roo'
namespace :import do
  desc "Import data"
  task data: :environment do
    (16..21).each do |idx|
      puts "Importing Data Angkatan #{idx}"
      data = Roo::Spreadsheet.open("lib/angkatan_#{idx}.xlsx") # open spreadsheet
      headers = data.row(1) # get header row
      data.each_with_index do |row, idx|
        next if idx == 0 # skip header row
        # create hash from headers and cells
        user_data = Hash[[headers, row].transpose]
        # next if user exists
        if ListUser.exists?(email: user_data['email'])
          puts "User with email #{user_data['email']} already exists"
          next
        elsif user_data['email'].blank?
          puts 'return email blank'
        end
        
        user = ListUser.new(user_data)
        user.skip = true
        puts "Saving User with email #{user.email}"
        user.save
      end
    end
  end
end