class Contract < ActiveRecord::Base
	has_many :orders
	has_many :invoices
	has_many :notes
	has_one :client

	mount_uploader :file, FileUploader

	def self.search(search)
	  if search
	  	@clients = Client.all.where("name LIKE ?", "%#{search}%")
	    @ids = @clients.pluck(:id)
	    where("client_id IN (?) OR title LIKE ?", @ids, "%#{search}%")
	  else
	    all
	  end
	end

	def self.client
		Client.all.find(:client_id)
	end

	def self.search_month(startTime, endTime)
		if startTime&&endTime
			@startdate = Date.parse("#{startTime}")
			@enddate = Date.parse("#{endTime}")
			where(:sign_date => @startdate..@enddate)
		elsif startTime && !endTime

		elsif !startTime && endTime

		else
			all
		end
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	    	csv << column_names
	    	all.each do |product|
	      		csv << product.attributes.values_at(*column_names)
	    	end
  		end
	end
end
