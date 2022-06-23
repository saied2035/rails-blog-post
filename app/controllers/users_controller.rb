class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = all_users
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
  end
end
