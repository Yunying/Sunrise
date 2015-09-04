class Contract < ActiveRecord::Base
	has_many :orders
	has_many :invoices
	has_many :notes

	def self.search(search)
	  if search
	    where('title LIKE ? OR sign_date LIKE ?', "%#{search}%", "%#{search}%")
	  else
	    all
	  end
	end
end
