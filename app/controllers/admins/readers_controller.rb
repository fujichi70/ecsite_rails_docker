class Admins::ReadersController < Admins::ApplicationController
  before_action :set_admins_reader, only: %i[ show ]

  def index
    @users = User.all.includes(:addresses)
  end

  def show

  end

  
  private
    def set_admins_reader(id:)
      @user = User.includes(:addresses).where(addresses: {user_id: id})
    end
end
