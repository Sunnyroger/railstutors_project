class CommentsController < ApplicationController
  def new
  	@post=Post.find(params[:post_id])
  	@comment=Comment.new
  end
  def create
  	@post=Post.find(params[:post_id])
  	@comment = @post.comments.new(params[:comment])
  	if @comment.save 
      flash[:notice] = "Successfully!"
  	  redirect_to post_path(@post)
  	else
  	  flash[:error] = "Content can't be blank!"
  	  render :new
  	end
  end
end