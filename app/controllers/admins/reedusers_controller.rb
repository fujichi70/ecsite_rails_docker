class Admins::ReedusersController < ApplicationController
  before_action :set_admins_reeduser, only: %i[ show edit update destroy ]

  # GET /admins/reedusers or /admins/reedusers.json
  def index
    @admins_reedusers = User.all
  end

  # GET /admins/reedusers/1 or /admins/reedusers/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_reeduser
      @admins_reeduser = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_reeduser_params
      params.fetch(:admins_reeduser, {})
    end
end
