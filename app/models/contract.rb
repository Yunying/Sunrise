class Contract < ActiveRecord::Base
	has_many :orders
	has_many :invoices
	has_many :notes

	def self.search(search)
	  if search
	    where('title LIKE ? OR sign_date LIKE ?', "%#{search}%", "%#{search}-%")
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
