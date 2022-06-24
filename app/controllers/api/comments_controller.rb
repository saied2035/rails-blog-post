class Api::CommentsController < ApplicationController
  before_action :set_post, only: %i[index create show update destroy]

  def index  
    render :json => @post.comments, status: :ok
  end

  def create
    @comment = @post.comments.create!(comment_params)
    json_response(@comment, :created)
  end

end