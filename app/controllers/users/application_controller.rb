class Users::ApplicationController < ApplicationController
    layout 'users/application'
    before_action :authenticate_user!

		# def after_sign_up_path_for(resource)
    #      new_users_address_registration_path
    # end
end
