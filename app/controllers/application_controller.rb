class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :update_allowed_parameters, if: :devise_controller?

  def all_users
    User.all.where('confirmed_at IS NOT NULL').order('id asc')
  end

  def current_post
    User.find(params[:user_id]).posts.find(params[:id] || params[:post_id])
  end

  def all_users_post_controller
    User.find(params[:user_id])
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
