require 'bundler'
Bundler.require


module Sakane

	class Footage < ActiveRecord::Base
	end

	class Application < Sinatra::Base

		db_conf = YAML.load_file('db/database.yml')

		configure do
			include ERB::Util
			register Sinatra::ActiveRecordExtension
			set :database, db_conf['development']
		end

		configure :development do
			# enable auto reloader
			register Sinatra::Reloader
    		enable :logging
			enable :inline_templates
		end



		# routing!
		get '/' do
			footages = Sakane::Footage.all
			erb :list, :locals => {:footages => footages}
		end



		# get '/archive/:count' do
		# 	erb "view latest"
		# end



		get '/footage/:id' do

			if params['id'] =~ /^\d+$/
				if footage = Sakane::Footage.where(:id=>params['id']).first

					file_path = "text/"+params["id"]+".md";

					text = File.exist?(file_path) ? File.read(file_path) : ""

					file_found = !text.empty?

					erb :single, :locals => {
						:footage => footage,
						:file_found => file_found,
						:text => RDiscount.new(text, :autolink, :filter_html).to_html}
				else
					erb :error404
				end
			else
				erb :error404
			end
		end

		get '/contributors' do
			erb :contributors
		end


		get '/contact' do
			erb :contact
		end

		get '/404' do
			erb :error404
		end
	end
end
