class Api::CommentsController < ApplicationController
  
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render :json => @comments, status: :ok
  end

  def create
    @comment = @post.comments.create!(comment_params)
    json_response(@comment, :created)
  end

end