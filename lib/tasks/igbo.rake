namespace :igbo do
  desc "Load the db from the csv"
  task :load => :environment do
    path = "public/dict.csv"
    puts "Loading entries from #{path}"
    IgboEntry.delete_all
    Cleaner.csv2db path
  end
end