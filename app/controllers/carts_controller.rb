class CartsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_cart, only: %i[ add_cart update_cart destroy ]

  # カートはユーザー以外もカートに入れられる

  # カート内表示
  def index
    if current_user
    @carts = Cart.where(user_id: current_user.id)
    else
      if session[:cart].present?
      @carts = session[:cart]
      end
    end
  end

  # def current_cart
  #   if current_user
  #     # ユーザーとカートの紐付け
  #     current_cart = current_user.cart || current_user.create_cart!
  #   else
  #     # セッションとカートの紐付け
  #     current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
  #     session[:cart_id] ||= current_cart.id
  #   end
  # end

  # カート内アイテムの表示
  def my_cart
    @carts = Cart.includes(:product)
    @total = @carts.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  # アイテムの追加
  def add_cart(product_id: nil, quantity: nil)
    cart = Cart.find_by(product_id: product_id) || Cart.build(product_id: product_id)
    cart.quantity += quantity.to_i
  end

  # アイテムの更新
  def update_cart(quantity: nil)
    Cart.find_by(product_id: product_id).update(quantity: quantity.to_i)
  end

  # アイテムの削除
  def destroy
    if @cart.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to my_cart_path
  end

  private

  def set_cart(product_id: nil)
    @cart = current_cart.carts.find_by(product_id: product_id)
  end
end
