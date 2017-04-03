require 'csv'
require 'pry'

namespace :user_tasks do
  desc 'Import to database'
  task import: :environment do
    begin
      csv_text = File.read('lib/tasks/users.csv')
      csv = CSV.parse(csv_text, headers: true)
      csv.each do |row|
        User.create!(row.to_hash)
      end
    rescue => e
      puts e.message
    end
  end

  desc 'Export from database to file'
  task export: :environment do
    File.open('lib/tasks/users.csv', 'w') do |file|
      headers = %w(first_name last_name username
                   password email birthday)
      file << CSV.generate_line(headers)
      User.all.each do |u|
        file << CSV.generate_line([u.first_name, u.last_name, u.username,
                                   u.password, u.email,
                                   u.birthday.strftime('%Y-%m-%d')])
      end
    end
  end
end
