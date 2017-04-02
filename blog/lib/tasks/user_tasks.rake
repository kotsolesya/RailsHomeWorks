require 'csv'

namespace :user_tasks do
  desc 'Import to database'
  task import: :environment do
    csv_text = File.read('lib/tasks/users.csv')

    CSV.foreach(csv_text, headers: true) do |row|
      puts row.to_hash
      User.create(row.to_hash)
    end
  end

  desc 'Export from database to file'
  task export: :environment do
    File.open('lib/tasks/users.csv', 'a') do |file|
      file << User.column_names << "\n"
      User.all.each do |user|
        file << user.attributes.values_at(*User.column_names) << "\n"
      end
      file.close
    end
  end
end
