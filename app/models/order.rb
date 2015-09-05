class Order < ActiveRecord::Base
	has_many :invoices
	belongs_to :contract

	def self.search(search)
	  if search
	  	@vendors = Vendor.all.where("name LIKE ?", "%#{search}%")
	    @ids = @vendors.pluck(:id)
	    where("vendor_id IN (?) OR order_id LIKE ?", @ids, "%#{search}%")
	  else
	    all
	  end
	end

	def self.search_month(startTime, endTime)
		
		if startTime&&endTime
			if endTime.empty?
				endTime = Date.current
			end
			if startTime.empty?
				startTime = "2001-01-01"
			end
			@startdate = Date.parse("#{startTime}")
			@enddate = Date.parse("#{endTime}")
			@contracts = Contract.all.where('sign_date > ? AND sign_date < ?', @startdate, @enddate)
			@ids = @contracts.pluck(:id)
			where("contract_id IN (?)", @ids)
		else
			all
		end
	end
end
