class Admins::ApplicationController < ApplicationController
    layout 'admin/login'
    before_action :authenticate_admin!
end