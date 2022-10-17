class ShopsController < ApplicationController
before_action :set_admins_order, only: %i[ show edit update destroy ]

  def index
  end

  def show
  end
  
  def new(order: nil, order_description: nil, order_price: nil, order_quantity: nil, image: nil)
    @order = Order.new
  end

  def edit(id:)
    @admins_orders = Order.find(id)
  end
  
  def create
    @order = Order.new(admins_order_params)
    if @order.save
      return redirect_to admins_orders_path, notice: "登録しました。"
    else
      render "new"
    end

    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to admins_order_url([:admins, @order]), notice: "order was successfully created." }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    @order.update(admins_order_params)

    return redirect_to admins_orders_path, notice: "更新しました。"
    
    # respond_to do |format|
    #   if @order.update(admins_order_params)
    #     format.html { redirect_to admins_order_url(@order), notice: "order was successfully updated." }
    #     format.json { render :show, status: :ok, location: @order }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end

  end

  def destroy
    @order.destroy

    return redirect_to admins_orders_path, notice: "削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop(id:)
      @order = Order.find(id)
    end

    def admins_order_params
      params.permit(:user_id, :order_id, :order_description, :order_price, :order_quantity, :image)
    end
end
