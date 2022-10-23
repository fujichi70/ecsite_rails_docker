class Cart < ApplicationRecord
	belongs_to :product

	# カート内の商品合計に利用
  def sum_of_price
    product.price * quantity
  end
end
