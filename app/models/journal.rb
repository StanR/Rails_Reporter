# class HmValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#     #unless value =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not a valid time")
#     end
#   end
# end


class Journal < ActiveRecord::Base
belongs_to :project

validates :activity, :presence => true
validates :time, :presence => true


	def validate_time
		if self.time[/^[0-9]*/] != ""
		    return true
		  else
		    self.errors.full_messages << "Shortcut URL must begin with a letter"
		    return false
		  end
	end


	def self.total_time
		hours = 0
		minutes = 0
		self.all.each do |record|
			hours += record.hours
			minutes += record.minutes
		end
		hours += minutes / 60
		minutes = minutes % 60

		if minutes.to_s.length == 1
			minutes = '0' + minutes.to_s
		end


		return hours.to_s+':'+minutes.to_s
	end

	def time
		self.hours.to_s+':'+self.minutes.to_s
	end

	def time=(time_str)
		self.hours = time[/^(.*):[0-9]{1,2}*/]
		self.minutes = time[/^[0-9]{1,2}:(.*)*/]
	end

end