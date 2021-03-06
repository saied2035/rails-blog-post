class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  after_action :save_my_previous_url, only: [:new]
  def new
    respond_to do |format|
      format.html { render :new, locals: { comment: Comment.new } }
    end
  end

  def create
    user = current_user
    post = current_post
    comment = Comment.new(comment_params)
    comment.author = user
    comment.post = post
    if comment.save
      flash[:notice] = 'Comment saved successfully'
      redirect_to session[:my_previous_url]
    else
      flash[:alert] = 'Error: Comment could not be saved'
      redirect_to new_user_post_comment_url
    end
  end

  def destroy
    Comment.destroy(params[:id])
    where_to_redirect_delete
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def where_to_redirect_delete
    if params[:distination] == 'index'
      redirect_back_or_to user_posts_url
    else
      redirect_back_or_to user_post_url(id: params[:post_id])
    end
  end

  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer || '').path
  end
end
