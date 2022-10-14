class Admins::OrdersController < ApplicationController
	before_action :set_admins_order, only: %i[ show, edit ]
	def index
		@orders = 
	end

	private
    def set_admins_order(id:)
      @user = User.includes(:addresses).where(addresses: {user_id: id})
    end
end
