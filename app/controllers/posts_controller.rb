class PostsController < ApplicationController
  def index
    all_posts
  end

  def show
    current_post
  end
end
