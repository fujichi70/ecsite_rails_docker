class Address < ApplicationRecord
	belongs_to :user, inverse_of: :addresses
end