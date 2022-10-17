class Users::AddressRegistrationsController < ApplicationController
  layout 'users/address'
  before_action :set_users_address_registration, only: %i[ show edit update destroy ]

  # GET /users/address_registrations or /users/address_registrations.json
  def index
  end

  # GET /users/address_registrations/1 or /users/address_registrations/1.json
  def show
  end

  # GET /users/address_registrations/new
  def new
  end

  # GET /users/address_registrations/1/edit
  def edit
  end

  # POST /users/address_registrations or /users/address_registrations.json
  def create(id: nil, zip: nil, address: nil, phone: nil)
    @address = Address.new

    @address.user_id = current_user.id
    @address.zip = zip
    @address.address = address
    @address.phone = phone

    if @address.save
      return redirect_to root_path, notice: "登録しました。"
    else
      render "new"
    end
  end

  # PATCH/PUT /users/address_registrations/1 or /users/address_registrations/1.json
  def update
    respond_to do |format|
      if @users_address_registration.update(users_address_registration_params)
        format.html { redirect_to users_address_registration_url(@users_address_registration), notice: "Address registration was successfully updated." }
        format.json { render :show, status: :ok, location: @users_address_registration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_address_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/address_registrations/1 or /users/address_registrations/1.json
  def destroy
    @users_address_registration.destroy

    respond_to do |format|
      format.html { redirect_to users_address_registrations_url, notice: "Address registration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_address_registration(id:)
      @user = User.find(id)
      @users_address_registration = Address.find(id)
    end

    # Only allow a list of trusted parameters through.
    def users_address_registration_params
      params.fetch(:users_address_registration, {})
    end
end
