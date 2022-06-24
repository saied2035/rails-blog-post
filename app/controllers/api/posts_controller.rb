class Api::PostsController < ApplicationController
  def index  
    puts 'I should be here!!'
    user = all_users_post_controller
    posts = user.posts.includes(:comments).order('id asc')
    render json: posts, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end