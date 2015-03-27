### bundle install

	$ bundle install --path vendor/bundle
	

### db/database.yml作る

example:

	development:
	  adapter: sqlite3
	  database: db/sakane_collection.sqlite3
	  
### dbをmigrate

	$ bundle exec rake db:migrate

### seed
	
db/seeds.rb
		
	range = 1..100
	range.each do |i|
	  Sakane::Footage.create(
	    title: "miniDV tape #{i}",
	    date: Date.today,
	    venue: "place #{i}",
	    latitude: 10.1 * i,
	    longitude: 12.2 * i,
	    tags: "testag")
	end

で

	$ bundle exec rake db:seed
	
### run
	
	$ bundle exec rackup

