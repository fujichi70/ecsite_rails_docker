class Admins::ApplicationController < ApplicationController
    layout 'admins/login'
    before_action :authenticate_admin!

    def after_sign_in_path_for(resource)
        admins_manages_path
    end
end