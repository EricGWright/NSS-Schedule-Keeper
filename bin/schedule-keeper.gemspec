Gem:Specification.new do |s|
	s.name = 'schedule-keeper'
	s.version = '1.0.0'
	s.date = '2013-05-28'
	s.summary = "Schedule Keeper"
	s.description = "Simple command line based schedule keeper"
	s.authors = [ "ewright"]
	s.email = 'musicmarketer@gmail.com'
	s.executables << 'schedule-keeper'

	['commander', 'sqlite3', 'sequel'].each do |dep|
		s.add_dependency dep
	end
end