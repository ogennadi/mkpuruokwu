namespace :igbo do
  desc "Load the db from raw csv"
  task :load => :environment do
    Cleaner.load_dict('public/dict-en.csv', EnglishEntry)
    Cleaner.load_dict('public/dict-ig.csv', IgboEntry)
  end

  desc "Load English entries"
  task :loaden => :environment do
    Cleaner.load_dict('public/dict-en.csv', EnglishEntry)
  end
  
  desc "Load Igbo entries"
  task :loadig => :environment do
    Cleaner.load_dict('public/dict-ig.csv', IgboEntry)
  end
end