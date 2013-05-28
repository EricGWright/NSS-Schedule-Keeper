require 'rubygems'
require "bundler/setup"
require 'commander/import'
require 'sequel'

program :name, "Schedule Keeper"
program :version, '1.0.0'
program :description, 'A simple command line based schedule keeper'

DB = Sequel.sqlite('shows_db.db')

unless DB.table_exists? :shows
	DB.create_table :shows do
		primary_key :id
		String :band
		String :date		
	end
end

ds = DB[:shows]


command :new do |c|
  c.syntax = 'schedule-keeper new'
  c.description = 'Creates a new tour date'
  c.option '--band STRING', String, 'Band'
  c.option '--date STRING', String, 'Date'
  c.action do |args, options|
  	if options.band.nil?
  		options.band = ask('Provide the band name :')
  	end
  	if options.date.nil?
  		options.date = ask('Provide the tour date :')
  	end
  	ds.insert(:band => options.band, :date => options.date)
  	say 'Tour date added!'
  end
end


command :list do |c|
	c.syntax = 'schedule-keeper list'
	c.description = 'Lists the schedule.'
	c.action do |args, options|
		ds.each do |show|
			puts "#{show[:band]} #{show[:date]}"
		end
	end
end

# command :view do |c|
# 	c.syntax = 'schedule-keeper view <id>'
# 	c.description = 'To view the date of a show'
# 	c.action do |args, options|
# 		if args.first.nil?
# 			puts "Please specify the band to be shown."
# 		else
# 			ds.where(:id => args.first).each do |task|
# 				puts "Band : #{show[band]}"
# 				puts "City : #{show[city]}"
# 			end
# 		end
# 	end
# end

# command :delete do |c|
# 	c.syntax = 'schedule-keeper delete <id>'
# 	c.description = 'Delete a task'
# 	c.action do |args, options|
# 		if args.first.nil?
# 			puts "Please specify the show to be deleted"
# 		else
# 			items = ds.where(:id => args.first)
# 			if items.count > 0
# 				items.delete
# 				puts "Deleted"
# 			else
# 				puts "Show not found"
# 			end
# 		end
# 	end
# end
