# be rake db:create_migration NAME=create_footages

class CreateFootages < ActiveRecord::Migration
  def change
  	# binary
	# boolean
	# date
	# datetime
	# decimal
	# float
	# integer
	# primary_key
	# string
	# text
	# time
	# timestamp
	
  	create_table :footages do |t|
		# timestampを入れると、自動でcreated_at/updated_atをdatetimeで加えてくれる
  		t.string :title
  		t.date :date
  		t.string :venue
  		t.float :latitude
  		t.float :longitude
  		t.string :tags
  		t.timestamps
  	end
  end
end
