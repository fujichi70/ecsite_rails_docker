# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    # super
    @user = User.new
    @addresses = @user.addresses.build
  end
  
  # POST /resource
  def create
    super
    @user = User.new(user_params)
    @user.addresses.build
    @user.save
  end
  
  # GET /resource/edit
  def edit
    @user = User.find(current_user.id)
  end
  
  # PUT /resource
  def update
    @user = User.find(current_user.id)
    logger.debug(@user)
    @user.addresses.where(user_id: current_user.id)
    if @user.update(user_params)
      redirect_to root_path, notice: '更新しました'
    else
      render :edit
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def user_params
    params.permit(:sign_up, keys: [:name, addresses_attributes: [:user_id, :zip, :address, :phone]])
  end
end
