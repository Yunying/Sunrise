class Order < ActiveRecord::Base
	has_one :invoice
	belongs_to :contract
end
