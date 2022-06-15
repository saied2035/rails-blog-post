class LikesController < ApplicationController
	 def new
    respond_to do |format|
      format.html { render :new, locals: { like: Like.new } }
    end
  end
  def create
    user = current_user
    post = current_post
    post.likes.where("author_id = #{user.id}").length.positive? && (
    	flash[:error] = "Error: You liked the post already"
        redirect_to user_post_url(id:post.id)
        return
    )
    like = Like.new(author:user,post:post)
      if like.save
        flash[:success] = "Like saved successfully"
        redirect_to user_post_url(id:post.id)
      else
        flash[:error] = "Error: Like could not be saved"
        redirect_to new_user_post_like_url
    end 
  end
end
