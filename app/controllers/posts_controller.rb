class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = all_users_post_controller
    @current_user = current_user
    @posts = @user.posts.includes(:comments).order('id asc')
    respond_to do |format|
      format.html
      format.json { render :json => @posts }
    end

  end

  def show
    @post = current_post
    @user = current_user
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    user = current_user
    post = Post.new(post_params)
    post.author = user
    if post.save
      flash[:notice] = 'Post saved successfully'
      redirect_to user_posts_url
    else
      flash[:alert] = 'Error: Post could not be saved'
      redirect_to new_user_post_url
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
