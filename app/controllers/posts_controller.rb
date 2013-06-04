class PostsController < ApplicationController
  def index
  	@posts = Post.all.sort_by{|post| post.votes.count}.reverse
  end
  def show
  	@post = Post.find(params[:id])
  end
  def new
  	@post = Post.new
  end
  def create
    @post = Post.new(params[:post])
    if @post.save
  	  redirect_to posts_path
    else
      flash[:error] = "Title and Url can't be blank." 
      render :new
    end  
  end
end