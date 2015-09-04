class Order < ActiveRecord::Base
	has_many :invoices
	belongs_to :contract
end
