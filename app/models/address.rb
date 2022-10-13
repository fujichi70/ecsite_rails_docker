class Address < ApplicationRecord
	belongs_to :user, foreign_key: "user_id", class_name: "id"
end