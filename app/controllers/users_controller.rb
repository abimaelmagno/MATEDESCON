class UsersController < ApplicationController
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    new_firma_path(current_user) #your path
  end

end
