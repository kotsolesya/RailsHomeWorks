require 'csv'

namespace :user_tasks do
  desc 'Import to database'
  task import: :environment do
    CSV.foreach(filename, headers: true) do |row|
      User.create!(row.to_hash)
    end
  end

  desc 'Export from database to file'
  task export: :environment do |args|
      puts args.inspect
  #  u << User.all
  #  CSV.generate do |csv|
  #    csv << User.column_names
  #    User.all.each do |result|
  #      csv << result.attributes.values_at(*User.column_names)
  #    end
  #  end
  end
end
