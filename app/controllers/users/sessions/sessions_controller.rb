# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    search_path
  end
end
