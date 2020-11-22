
namespace :db do
  namespace :seed do
    #rake db:seed:single SEED=users // seed_name_without_.seeds.rb>
    desc "Run single Seed"
    task :single => :environment do
      filename = Dir[File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED']}.seeds.rb")][0]
      load(filename) if File.exist?(filename)
    end
  end
end
