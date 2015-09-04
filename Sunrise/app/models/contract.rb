class Contract < ActiveRecord::Base
	has_many :orders
	has_many :invoices
	has_many :notes
end
