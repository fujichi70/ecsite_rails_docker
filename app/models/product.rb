class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :carts, dependent: :destroy

	validates :product, presence: true
	validates :product_description, presence: true
	validates :product_price, presence: true, numericality: { only_integer: true }
	validates :product_quantity, presence: true, numericality: { only_integer: true }
end
