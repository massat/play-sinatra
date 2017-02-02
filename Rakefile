require File.join(File.dirname(__FILE__), 'app.rb')


namespace :db do
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  end

  task :dump do
    ActiveRecord::SchemaDumper.dump
  end
end

