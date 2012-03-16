class JournalsController < ApplicationController
  	before_filter :base


  	#base before filter
	def base
		if !is_user?
			redirect_to :controller => "users", :action => "login"
		end
	end

	def index
	end

	def day
		@journal = Journal.where("user_id = "+@curUser.id.to_s+" AND date = '"+params[:id]+"'")
	end

	def new
		if request.post?
			@journal = Journal.new(params[:journal])
			@journal.user_id = @curUser.id
			@journal.date = Time.new.strftime('%Y-%m-%d')

			if @journal.save
				redirect_to :action => "day", :id => params[:id]
			else

      		end
		else
			@journal = Journal.new


		end
	end

	#ajax for calendar json events
	#@TODO: optimize sql query
	def a_events
		year = Time.at(params[:id].to_i).strftime('%Y')
		month = Time.at(params[:id].to_i).strftime('%m').to_i - 1
		if month.to_s.length == 1
			month = '0' + month.to_s
		end

		@journal = Journal.where("user_id = "+@curUser.id.to_s+" AND date LIKE '%"+year+'-'+month+"%'")

		@events = []
		@journal.each do |record|
			@events.append( {'id' => record.id,
						'title' => record.activity,
						'start' => record.date,
						'url' => ""
			})
		end


		render :text => @events.to_json
    	
	end
end